<!-- application/views/client/table_selection.php -->
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chọn Bàn - <?= htmlspecialchars($store['name'] ?? 'Cà Phê Việt') ?></title>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Quicksand', 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
            min-height: 100vh;
            padding-bottom: 120px;
        }
        
        /* Header */
        .header {
            background: rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(15px);
            padding: 1rem 2rem;
            position: sticky;
            top: 0;
            z-index: 100;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        
        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .back-btn {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #fff;
            text-decoration: none;
            font-size: 1.1rem;
            font-weight: 600;
            padding: 0.8rem 1.5rem;
            background: rgba(255,255,255,0.1);
            border-radius: 50px;
            transition: all 0.3s;
        }
        
        .back-btn:hover {
            background: rgba(255,255,255,0.2);
            transform: translateX(-5px);
        }
        
        .header-title {
            display: flex;
            align-items: center;
            gap: 0.8rem;
        }
        
        .header-title .icon {
            width: 45px;
            height: 45px;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }
        
        .header-title h1 {
            color: #fff;
            font-size: 1.4rem;
            font-weight: 700;
        }
        
        .header-title p {
            color: rgba(255,255,255,0.6);
            font-size: 0.9rem;
        }
        
        .header-stats {
            display: flex;
            gap: 1rem;
        }
        
        .stat-item {
            background: rgba(255,255,255,0.1);
            padding: 0.8rem 1.2rem;
            border-radius: 15px;
            text-align: center;
        }
        
        .stat-item .number {
            color: #4ade80;
            font-size: 1.5rem;
            font-weight: 700;
        }
        
        .stat-item .label {
            color: rgba(255,255,255,0.7);
            font-size: 0.85rem;
        }
        
        /* Main */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }
        
        .page-title {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .page-title h2 {
            color: #fff;
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .page-title p {
            color: rgba(255,255,255,0.6);
            font-size: 1.1rem;
        }
        
        /* Legend */
        .legend {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin-bottom: 2rem;
            flex-wrap: wrap;
        }
        
        .legend-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: rgba(255,255,255,0.8);
            font-size: 1rem;
        }
        
        .legend-dot {
            width: 16px;
            height: 16px;
            border-radius: 50%;
        }
        
        .legend-dot.available { background: linear-gradient(135deg, #4ade80, #22c55e); }
        .legend-dot.occupied { background: linear-gradient(135deg, #f87171, #ef4444); }
        .legend-dot.selected { background: linear-gradient(135deg, #60a5fa, #3b82f6); }
        
        /* Tables Grid */
        .tables-section {
            background: rgba(255,255,255,0.05);
            border-radius: 30px;
            padding: 2rem;
            border: 1px solid rgba(255,255,255,0.1);
        }
        
        .tables-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(140px, 1fr));
            gap: 1.5rem;
        }
        
        .table-card {
            aspect-ratio: 1;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 24px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            border: 4px solid transparent;
        }
        
        .table-card::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: conic-gradient(transparent, rgba(0,0,0,0.05), transparent 30%);
            animation: rotate 4s linear infinite;
            opacity: 0;
            transition: opacity 0.3s;
        }
        
        .table-card:hover::before {
            opacity: 1;
        }
        
        @keyframes rotate {
            100% { transform: rotate(360deg); }
        }
        
        .table-card:hover {
            transform: translateY(-10px) scale(1.05);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.4);
        }
        
        .table-card.selected {
            border-color: #3b82f6;
            background: linear-gradient(135deg, #dbeafe, #bfdbfe);
            transform: translateY(-10px) scale(1.08);
        }
        
        .table-card.selected .table-icon {
            animation: bounce 0.6s ease infinite;
        }
        
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        
        .table-card.occupied {
            background: linear-gradient(135deg, #fee2e2, #fecaca);
            cursor: not-allowed;
            opacity: 0.8;
        }
        
        .table-card.occupied:hover {
            transform: none;
            box-shadow: none;
        }
        
        .table-icon {
            font-size: 3rem;
            margin-bottom: 0.5rem;
            position: relative;
            z-index: 1;
        }
        
        .table-name {
            font-size: 1.2rem;
            font-weight: 700;
            color: #1e293b;
            position: relative;
            z-index: 1;
        }
        
        .table-status {
            font-size: 0.85rem;
            font-weight: 600;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            margin-top: 0.5rem;
            position: relative;
            z-index: 1;
        }
        
        .status-available {
            background: linear-gradient(135deg, #dcfce7, #bbf7d0);
            color: #166534;
        }
        
        .status-occupied {
            background: linear-gradient(135deg, #fee2e2, #fecaca);
            color: #991b1b;
        }
        
        .status-selected {
            background: linear-gradient(135deg, #dbeafe, #bfdbfe);
            color: #1e40af;
        }
        
        /* Booking Panel */
        .booking-panel {
            position: fixed;
            bottom: -100%;
            left: 0;
            right: 0;
            background: rgba(15, 23, 42, 0.98);
            backdrop-filter: blur(20px);
            border-top: 1px solid rgba(255,255,255,0.1);
            padding: 1.5rem 2rem;
            transition: all 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            z-index: 200;
            border-radius: 30px 30px 0 0;
        }
        
        .booking-panel.show {
            bottom: 0;
        }
        
        .booking-content {
            max-width: 800px;
            margin: 0 auto;
        }
        
        .booking-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.5rem;
        }
        
        .selected-table-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .selected-table-info .icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #3b82f6, #1d4ed8);
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
        }
        
        .selected-table-info h3 {
            color: #fff;
            font-size: 1.4rem;
            font-weight: 700;
        }
        
        .selected-table-info p {
            color: rgba(255,255,255,0.6);
            font-size: 1rem;
        }
        
        .close-panel {
            width: 45px;
            height: 45px;
            background: rgba(255,255,255,0.1);
            border: none;
            border-radius: 50%;
            color: #fff;
            font-size: 1.5rem;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .close-panel:hover {
            background: rgba(239, 68, 68, 0.8);
            transform: rotate(90deg);
        }
        
        /* Form */
        .booking-form {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .form-group {
            position: relative;
        }
        
        .form-group label {
            display: block;
            color: rgba(255,255,255,0.8);
            font-size: 0.95rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 1rem 1rem 1rem 3rem;
            font-size: 1.1rem;
            font-family: inherit;
            background: rgba(255,255,255,0.1);
            border: 2px solid rgba(255,255,255,0.2);
            border-radius: 15px;
            color: #fff;
            transition: all 0.3s;
        }
        
        .form-group input::placeholder {
            color: rgba(255,255,255,0.4);
        }
        
        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #3b82f6;
            background: rgba(59, 130, 246, 0.1);
        }
        
        .form-group .icon {
            position: absolute;
            left: 1rem;
            top: 2.8rem;
            color: rgba(255,255,255,0.5);
            font-size: 1.1rem;
        }
        
        .form-group select option {
            background: #1e293b;
            color: #fff;
        }
        
        .btn-confirm {
            width: 100%;
            padding: 1.2rem 2rem;
            font-size: 1.3rem;
            font-weight: 700;
            font-family: inherit;
            background: linear-gradient(135deg, #4ade80 0%, #22c55e 100%);
            color: #fff;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.8rem;
        }
        
        .btn-confirm:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(34, 197, 94, 0.4);
        }
        
        .btn-confirm:active {
            transform: translateY(0);
        }
        
        /* Success Modal */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0,0,0,0.8);
            backdrop-filter: blur(10px);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 300;
        }
        
        .modal-overlay.show {
            display: flex;
        }
        
        .modal-content {
            background: linear-gradient(135deg, #1e293b, #0f172a);
            border-radius: 30px;
            padding: 3rem;
            text-align: center;
            max-width: 450px;
            width: 90%;
            border: 1px solid rgba(255,255,255,0.1);
            animation: modalPop 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }
        
        @keyframes modalPop {
            0% { transform: scale(0.5); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }
        
        .modal-icon {
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, #4ade80, #22c55e);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 3rem;
            animation: checkmark 0.8s ease;
        }
        
        @keyframes checkmark {
            0% { transform: scale(0) rotate(-180deg); }
            100% { transform: scale(1) rotate(0); }
        }
        
        .modal-content h2 {
            color: #fff;
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
        }
        
        .modal-content p {
            color: rgba(255,255,255,0.7);
            font-size: 1.1rem;
            margin-bottom: 2rem;
        }
        
        .modal-content .table-info {
            background: rgba(255,255,255,0.1);
            padding: 1.5rem;
            border-radius: 20px;
            margin-bottom: 2rem;
        }
        
        .modal-content .table-info h3 {
            color: #4ade80;
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }
        
        .modal-btn {
            padding: 1rem 3rem;
            font-size: 1.2rem;
            font-weight: 700;
            font-family: inherit;
            background: linear-gradient(135deg, #3b82f6, #1d4ed8);
            color: #fff;
            border: none;
            border-radius: 15px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .modal-btn:hover {
            transform: scale(1.05);
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 1rem;
            }
            
            .header-stats {
                width: 100%;
                justify-content: center;
            }
            
            .tables-grid {
                grid-template-columns: repeat(3, 1fr);
                gap: 1rem;
            }
            
            .table-card {
                border-radius: 18px;
            }
            
            .table-icon {
                font-size: 2.2rem;
            }
            
            .table-name {
                font-size: 1rem;
            }
            
            .booking-form {
                grid-template-columns: 1fr;
            }
            
            .page-title h2 {
                font-size: 1.6rem;
            }
        }
        
        @media (max-width: 480px) {
            .tables-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <a href="<?= base_url('client') ?>" class="back-btn">
                <i class="fas fa-arrow-left"></i>
                <span>Quay lại</span>
            </a>
            
            <div class="header-title">
                <div class="icon">☕</div>
                <div>
                    <h1><?= htmlspecialchars($store['name'] ?? 'Cà Phê Việt') ?></h1>
                    <p><i class="fas fa-map-marker-alt"></i> <?= htmlspecialchars($store['address'] ?? '') ?></p>
                </div>
            </div>
            
            <div class="header-stats">
                <div class="stat-item">
                    <div class="number" id="availableCount"><?= count(array_filter($tables, fn($t) => empty($t['checked']) && $t['status'] == 0)) ?></div>
                    <div class="label">Bàn trống</div>
                </div>
                <div class="stat-item">
                    <div class="number" style="color: #f87171"><?= count(array_filter($tables, fn($t) => !empty($t['checked']) || $t['status'] == 1)) ?></div>
                    <div class="label">Đang phục vụ</div>
                </div>
            </div>
        </div>
    </header>
    
    <!-- Main -->
    <main class="container">
        <div class="page-title">
            <h2>🪑 CHỌN BÀN CỦA BẠN</h2>
            <p>Nhấn vào bàn trống để đặt chỗ</p>
        </div>
        
        <div class="legend">
            <div class="legend-item">
                <div class="legend-dot available"></div>
                <span>Còn trống</span>
            </div>
            <div class="legend-item">
                <div class="legend-dot occupied"></div>
                <span>Có khách</span>
            </div>
            <div class="legend-item">
                <div class="legend-dot selected"></div>
                <span>Đang chọn</span>
            </div>
        </div>
        
        <div class="tables-section">
            <div class="tables-grid">
                <?php foreach($tables as $table): 
                    $is_occupied = !empty($table['checked']) || $table['status'] == 1;
                ?>
                <div class="table-card <?= $is_occupied ? 'occupied' : '' ?>" 
                     data-id="<?= $table['id'] ?>"
                     data-name="<?= htmlspecialchars($table['name']) ?>"
                     onclick="selectTable(this)">
                    
                    <div class="table-icon">
                        <?php if($is_occupied): ?>
                            ☕
                        <?php else: ?>
                            🪑
                        <?php endif; ?>
                    </div>
                    <div class="table-name"><?= htmlspecialchars($table['name']) ?></div>
                    <span class="table-status <?= $is_occupied ? 'status-occupied' : 'status-available' ?>">
                        <?= $is_occupied ? '🔴 Có khách' : '🟢 Trống' ?>
                    </span>
                </div>
                <?php endforeach; ?>
            </div>
        </div>
    </main>
    
    <!-- Booking Panel -->
    <div class="booking-panel" id="bookingPanel">
        <div class="booking-content">
            <div class="booking-header">
                <div class="selected-table-info">
                    <div class="icon">🪑</div>
                    <div>
                        <h3 id="selectedTableName">--</h3>
                        <p>Bàn bạn đã chọn</p>
                    </div>
                </div>
                <button class="close-panel" onclick="closePanel()">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            
            <form id="bookingForm">
                <input type="hidden" name="table_id" id="tableId">
                
                <div class="booking-form">
                    <div class="form-group">
                        <label>Họ và tên</label>
                        <i class="fas fa-user icon"></i>
                        <input type="text" name="customer_name" placeholder="Nhập họ tên của bạn" required>
                    </div>
                    <div class="form-group">
                        <label>Số điện thoại</label>
                        <i class="fas fa-phone icon"></i>
                        <input type="tel" name="customer_phone" placeholder="Nhập số điện thoại" required>
                    </div>
                    <div class="form-group">
                        <label>Số khách</label>
                        <i class="fas fa-users icon"></i>
                        <select name="guests">
                            <?php for($i = 1; $i <= 10; $i++): ?>
                            <option value="<?= $i ?>"><?= $i ?> người</option>
                            <?php endfor; ?>
                        </select>
                    </div>
                </div>
                
                <button type="submit" class="btn-confirm">
                    <i class="fas fa-check-circle"></i>
                    XÁC NHẬN ĐẶT BÀN
                </button>
            </form>
        </div>
    </div>
    
    <!-- Success Modal -->
    <div class="modal-overlay" id="successModal">
        <div class="modal-content">
            <div class="modal-icon">✓</div>
            <h2>Đặt Bàn Thành Công!</h2>
            <p>Chúc bạn có khoảng thời gian tuyệt vời tại quán</p>
            <div class="table-info">
                <h3 id="modalTableName">--</h3>
                <p>Nhân viên sẽ đến phục vụ bạn ngay</p>
            </div>
            <button class="modal-btn" onclick="goToMenu()">
                <i class="fas fa-utensils"></i> Xem Menu
            </button>
        </div>
    </div>
    
    <script>
        let selectedTable = null;
        const storeId = <?= $store['id'] ?? 1 ?>;
        
        function selectTable(el) {
            if(el.classList.contains('occupied')) {
                // Hiệu ứng rung khi chọn bàn đã có khách
                el.style.animation = 'shake 0.5s ease';
                setTimeout(() => el.style.animation = '', 500);
                return;
            }
            
            // Bỏ chọn cũ
            document.querySelectorAll('.table-card').forEach(c => {
                c.classList.remove('selected');
                const status = c.querySelector('.table-status');
                if(!c.classList.contains('occupied')) {
                    status.textContent = '🟢 Trống';
                    status.className = 'table-status status-available';
                }
            });
            
            // Chọn mới
            el.classList.add('selected');
            const status = el.querySelector('.table-status');
            status.textContent = '🔵 Đang chọn';
            status.className = 'table-status status-selected';
            
            selectedTable = {
                id: el.dataset.id,
                name: el.dataset.name
            };
            
            // Cập nhật panel
            document.getElementById('selectedTableName').textContent = selectedTable.name;
            document.getElementById('tableId').value = selectedTable.id;
            
            // Hiện panel
            document.getElementById('bookingPanel').classList.add('show');
        }
        
        function closePanel() {
            document.getElementById('bookingPanel').classList.remove('show');
            document.querySelectorAll('.table-card.selected').forEach(c => {
                c.classList.remove('selected');
                const status = c.querySelector('.table-status');
                status.textContent = '🟢 Trống';
                status.className = 'table-status status-available';
            });
            selectedTable = null;
        }
        
        // Submit form
        document.getElementById('bookingForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            if(!selectedTable) return;
            
            const formData = new FormData(this);
            
            fetch('<?= base_url("client/book_table") ?>', {
                method: 'POST',
                body: formData
            })
            .then(r => r.json())
            .then(data => {
                if(data.success) {
                    // Ẩn panel
                    document.getElementById('bookingPanel').classList.remove('show');
                    
                    // Cập nhật bàn thành occupied
                    const tableCard = document.querySelector(`[data-id="${selectedTable.id}"]`);
                    tableCard.classList.remove('selected');
                    tableCard.classList.add('occupied');
                    tableCard.querySelector('.table-icon').textContent = '☕';
                    tableCard.querySelector('.table-status').textContent = '🔴 Có khách';
                    tableCard.querySelector('.table-status').className = 'table-status status-occupied';
                    
                    // Hiện modal thành công
                    document.getElementById('modalTableName').textContent = selectedTable.name;
                    document.getElementById('successModal').classList.add('show');
                    
                    // Cập nhật số bàn trống
                    const count = document.getElementById('availableCount');
                    count.textContent = parseInt(count.textContent) - 1;
                }
            });
        });
        
        function goToMenu() {
            window.location.href = '<?= base_url("client/menu/".$store["id"]) ?>/' + selectedTable.id;
        }
        
        // CSS shake animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes shake {
                0%, 100% { transform: translateX(0); }
                25% { transform: translateX(-10px); }
                75% { transform: translateX(10px); }
            }
        `;
        document.head.appendChild(style);
        
        // Auto refresh trạng thái bàn mỗi 30s
        setInterval(() => {
            fetch('<?= base_url("client/get_tables_status/") ?>' + storeId)
            .then(r => r.json())
            .then(tables => {
                tables.forEach(t => {
                    const card = document.querySelector(`[data-id="${t.id}"]`);
                    if(!card || card.classList.contains('selected')) return;
                    
                    const isOccupied = t.checked || t.status == 1;
                    if(isOccupied && !card.classList.contains('occupied')) {
                        card.classList.add('occupied');
                        card.querySelector('.table-icon').textContent = '☕';
                        card.querySelector('.table-status').textContent = '🔴 Có khách';
                        card.querySelector('.table-status').className = 'table-status status-occupied';
                    }
                });
            });
        }, 30000);
    </script>
</body>
</html>
