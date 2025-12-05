<?php
// application/controllers/Client.php
defined('BASEPATH') OR exit('No direct script access allowed');

class Client extends CI_Controller {
    
    public function __construct() {
        parent::__construct();
        $this->load->database();
        $this->load->helper('url');
    }
    
    // Trang chọn cửa hàng
    public function index() {
        $data['stores'] = $this->db->get('zarest_stores')->result_array();
        $this->load->view('client/store_list', $data);
    }
    
    // Trang chọn bàn
    public function tables($store_id = 1) {
        $data['store'] = $this->db->get_where('zarest_stores', ['id' => $store_id])->row_array();
        
        if(!$data['store']) {
            redirect('client');
            return;
        }
        
        // Lấy danh sách bàn theo store_id
        $this->db->where('store_id', $store_id);
        $this->db->order_by('id', 'ASC');
        $data['tables'] = $this->db->get('zarest_tables')->result_array();
        
        // Lấy danh sách zone
        $data['zones'] = $this->db->get('zarest_zones')->result_array();
        
        // Đếm bàn trống
        $this->db->where('store_id', $store_id);
        $this->db->where('status', 0);
        $this->db->or_where('checked IS NULL');
        $data['available_count'] = $this->db->count_all_results('zarest_tables');
        
        $this->load->view('client/table_selection', $data);
    }
    
    // Trang menu (sau khi chọn bàn)
    public function menu($store_id, $table_id) {
        $data['store'] = $this->db->get_where('zarest_stores', ['id' => $store_id])->row_array();
        $data['table'] = $this->db->get_where('zarest_tables', ['id' => $table_id])->row_array();
        $data['categories'] = $this->db->get('zarest_categories')->result_array();
        
        $this->db->where('store_id', $store_id);
        $data['products'] = $this->db->get('zarest_products')->result_array();
        
        $this->load->view('client/menu', $data);
    }
    
    // API đặt bàn
    public function book_table() {
        $table_id = $this->input->post('table_id');
        $customer_name = $this->input->post('customer_name');
        $customer_phone = $this->input->post('customer_phone');
        $guests = $this->input->post('guests');
        
        // Cập nhật trạng thái bàn
        $this->db->where('id', $table_id);
        $this->db->update('zarest_tables', [
            'status' => 1,
            'checked' => date('Y-m-d H:i:s')
        ]);
        
        // Lấy thông tin bàn
        $table = $this->db->get_where('zarest_tables', ['id' => $table_id])->row_array();
        
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode([
            'success' => true, 
            'table_id' => $table_id,
            'table_name' => $table['name'],
            'store_id' => $table['store_id']
        ]);
    }
    
    // API lấy trạng thái bàn realtime
    public function get_tables_status($store_id) {
        $this->db->where('store_id', $store_id);
        $tables = $this->db->get('zarest_tables')->result_array();
        
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode($tables);
    }
}
