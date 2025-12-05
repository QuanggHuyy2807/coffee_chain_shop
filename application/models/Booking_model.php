<?php
// application/models/Booking_model.php
class Booking_model extends CI_Model {
    
    public function create_booking($data) {
        return $this->db->insert('zarest_holds', $data);
    }
    
    public function get_booking_by_id($id) {
        return $this->db->get_where('zarest_holds', ['id' => $id])->row_array();
    }
    
    public function check_table_availability($table_id, $date, $time) {
        $this->db->where('table_id', $table_id);
        $this->db->where('booking_date', $date);
        $this->db->where('booking_time', $time);
        $this->db->where('status !=', 'cancelled');
        return $this->db->count_all_results('zarest_holds') == 0;
    }
}
