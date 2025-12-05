<!-- application/views/client/store_list.php -->
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chọn Cửa Hàng - Cà Phê Việt</title>
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
            overflow-x: hidden;
        }
        
        /* Background animation */
        .bg-animation {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }
        
        .bg-animation span {
            position: absolute;
            display: block;
            width: 20px;
            height: 20px;
            background: rgba(255, 255, 255, 0.05);
            animation: float 25s linear infinite;
            bottom: -150px;
            border-radius: 50%;
        }
        
        .bg-animation span:nth-child(1) { left: 25%; width: 80px; height: 80px; animation-delay: 0s; }
        .bg-animation span:nth-child(2) { left: 10%; width: 20px; height: 20px; animation-delay: 2s; animation-duration: 12s; }
        .bg-animation span:nth-child(3) { left: 70%; width: 20px; height: 20px; animation-delay: 4s; }
        .bg-animation span:nth-child(4) { left: 40%; width: 60px; height: 60px; animation-delay: 0s; animation-duration: 18s; }
        .bg-animation span:nth-child(5) { left: 65%; width: 20px; height: 20px; animation-delay: 0s; }
        .bg-animation span:nth-child(6) { left: 75%; width: 110px; height: 110px; animation-delay: 3s; }
        .bg-animation span:nth-child(7) { left: 35%; width: 150px; height: 150px; animation-delay: 7s; }
        .bg-animation span:nth-child(8) { left: 50%; width: 25px; height: 25px; animation-delay: 15s; animation-duration: 45s; }
        .bg-animation span:nth-child(9) { left: 20%; width: 15px; height: 15px; animation-delay: 2s; animation-duration: 35s; }
        .bg-animation span:nth-child(10) { left: 85%; width: 150px; height: 150px; animation-delay: 0s; animation-duration: 11s; }
        
        @keyframes float {
            0% { transform: translateY(0) rotate(0deg); opacity: 1; }
            100% { transform: translateY(-1000px) rotate(720deg); opacity: 0; }
        }
        
        /* Header */
        .header {
            background: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            padding: 1.5rem 2rem;
            position: sticky;
            top: 0;
            z-index: 100;
        }
        
        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .logo {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .logo-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
        }
        
        .logo-text h1 {
            color: #fff;
            font-size: 1.8rem;
            font-weight: 700;
        }
        
        .logo-text p {
            color: rgba(255,255,255,0.7);
            font-size: 0.9rem;
        }
        
        /* Main content */
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 2rem;
        }
        
        .page-title {
            text-align: center;
            margin-bottom: 3rem;
        }
        
        .page-title h2 {
            color: #fff;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .page-title p {
            color: rgba(255,255,255,0.6);
            font-size: 1.2rem;
        }
        
        /* Store cards */
        .stores-grid {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }
        
        .store-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 24px;
            padding: 2rem;
            display: flex;
            align-items: center;
            gap: 1.5rem;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            text-decoration: none;
            position: relative;
            overflow: hidden;
        }
        
        .store-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.1), transparent);
            transition: left 0.5s;
        }
        
        .store-card:hover::before {
            left: 100%;
        }
        
        .store-card:hover {
            transform: translateY(-8px) scale(1.02);
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        }
        
        .store-image {
            width: 100px;
            height: 100px;
            border-radius: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3rem;
            flex-shrink: 0;
        }
        
        .store-info {
            flex: 1;
        }
        
        .store-info h3 {
            color: #fff;
            font-size: 1.6rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .store-meta {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }
        
        .store-meta span {
            color: rgba(255,255,255,0.7);
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .store-meta i {
            width: 20px;
            color: #f5576c;
        }
        
        .store-status {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.5rem;
        }
        
        .status-badge {
            padding: 0.6rem 1.2rem;
            border-radius: 30px;
            font-weight: 700;
            font-size: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .status-open {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            color: #fff;
        }
        
        .status-closed {
            background: linear-gradient(135deg, #eb3349 0%, #f45c43 100%);
            color: #fff;
        }
        
        .store-arrow {
            width: 50px;
            height: 50px;
            background: rgba(255,255,255,0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-size: 1.5rem;
            transition: all 0.3s;
        }
        
        .store-card:hover .store-arrow {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            transform: translateX(5px);
        }
        
        /* Footer */
        .footer {
            text-align: center;
            padding: 2rem;
            color: rgba(255,255,255,0.5);
            font-size: 1rem;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .store-card {
                flex-direction: column;
                text-align: center;
                padding: 1.5rem;
            }
            
            .store-meta {
                align-items: center;
            }
            
            .store-arrow {
                display: none;
            }
            
            .page-title h2 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
    <!-- Background animation -->
    <div class="bg-animation">
        <span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span>
    </div>
    
    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <div class="logo">
                <div class="logo-icon">☕</div>
                <div class="logo-text">
                    <h1>CÀ PHÊ VIỆT</h1>
                    <p>Đậm đà hương vị Việt Nam</p>
                </div>
            </div>
        </div>
    </header>
    
    <!-- Main content -->
    <main class="container">
        <div class="page-title">
            <h2>🏪 CHỌN CỬA HÀNG</h2>
            <p>Vui lòng chọn cửa hàng bạn muốn đến</p>
        </div>
        
        <div class="stores-grid">
            <?php foreach($stores as $index => $store): 
                $icons = ['🏪', '🏠', '🏢', '☕', '🍵'];
                $gradients = [
                    'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
                    'linear-gradient(135deg, #f093fb 0%, #f5576c 100%)',
                    'linear-gradient(135deg, #4facfe 0%, #00f2fe 100%)',
                    'linear-gradient(135deg, #43e97b 0%, #38f9d7 100%)',
                    'linear-gradient(135deg, #fa709a 0%, #fee140 100%)'
                ];
            ?>
            <a href="<?= base_url('client/tables/'.$store['id']) ?>" class="store-card">
                <div class="store-image" style="background: <?= $gradients[$index % 5] ?>">
                    <?= $icons[$index % 5] ?>
                </div>
                <div class="store-info">
                    <h3><?= htmlspecialchars($store['name']) ?></h3>
                    <div class="store-meta">
                        <span><i class="fas fa-map-marker-alt"></i> <?= htmlspecialchars($store['address'] ?? 'Chưa cập nhật') ?></span>
                        <span><i class="fas fa-phone"></i> <?= htmlspecialchars($store['phone'] ?? '0123 456 789') ?></span>
                        <span><i class="fas fa-clock"></i> 07:00 - 22:00</span>
                    </div>
                </div>
                <div class="store-status">
                    <span class="status-badge status-open">
                        <i class="fas fa-circle" style="font-size:8px"></i> Đang mở
                    </span>
                </div>
                <div class="store-arrow">
                    <i class="fas fa-chevron-right"></i>
                </div>
            </a>
            <?php endforeach; ?>
        </div>
    </main>
    
    <footer class="footer">
        <p>© 2025 Cà Phê Việt - Tất cả quyền được bảo lưu</p>
    </footer>
</body>
</html>
