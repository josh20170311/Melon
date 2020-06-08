-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: melon
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ad_place`
--

DROP TABLE IF EXISTS `ad_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_place` (
  `Place_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `AD_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `AD_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Company_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `AD_Contant` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Place_Date` date NOT NULL,
  `Place_Days` int(11) NOT NULL,
  PRIMARY KEY (`Place_ID`),
  KEY `AD_Place_FK` (`AD_ID`),
  KEY `AD_Place_FK1` (`Company_ID`),
  CONSTRAINT `AD_Place_FK` FOREIGN KEY (`AD_ID`) REFERENCES `advertisement` (`AD_ID`),
  CONSTRAINT `AD_Place_FK1` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`Company_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_place`
--

LOCK TABLES `ad_place` WRITE;
/*!40000 ALTER TABLE `ad_place` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisement` (
  `AD_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Plan_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Plan_Content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`AD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement`
--

LOCK TABLES `advertisement` WRITE;
/*!40000 ALTER TABLE `advertisement` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `Article_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Member_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Title` tinytext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Product_ID` varchar(50) COLLATE utf8_bin NOT NULL,
  `Audited` tinyint(1) NOT NULL DEFAULT '0',
  `Upload_Time` datetime NOT NULL,
  PRIMARY KEY (`Article_ID`),
  KEY `Article_FK` (`Member_ID`),
  KEY `Article_Product_FK_idx` (`Product_ID`),
  CONSTRAINT `Article_FK` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Article_Product_FK` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES ('A1591266218846','test','三鏡頭防水中階手機 Sony Xperia 10 II開箱','Sony Mobile 最新推出的中階手機 Xperia 10 II，主打 6 吋 21：9 比例 OLED 寬螢幕，台灣上市規格搭載 Qualcomm Snapdragon 665，內建 4GB RAM / 128GB ROM、3,600mAh 電池，提供智慧充電技術，可同步調整充電速率，確保電池不超載，同時還增加 IP65 / 68 防水防塵等級。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱\r\n相機方面，Sony Xperia 10 II 後置獨立三鏡頭，採用 1,200 萬畫素標準、800 萬畫素超廣角、800 萬畫素望遠的三鏡頭組合，支援 4K 影片與 120fps 慢動作影片錄製，內建美食、肖像，並且增加了夜景模式，在低光源環境，也能捕捉清晰影像；前置鏡頭則是只有 800 萬畫素。\r\n\r\n\r\nSony Xperia 10 II 重點規格\r\n系統	Android 10\r\n雙卡雙待	4G + 4G\r\n尺寸 / 重量	157 x 69 x 8.2mm / 151g\r\n螢幕	6 吋 FHD+ OLED\r\n處理器	Qualcomm Snapdragon 665 八核心\r\nRAM / ROM	4GB RAM / 128GB\r\n前鏡頭	800 萬畫素（F2.0 光圈）\r\n後鏡頭	1,200 萬畫素（F2.0 光圈）\r\n800 萬畫素望遠（F2.4 光圈）\r\n800 萬畫素超廣角（F2.2 光圈）\r\nLED 補光燈\r\n電池	3,600 mAh（不可拆卸）\r\n特色功能	側面感應、肖像自拍、夜景模式、IP65 / IP68 防水防塵、Battery Care\r\nSony Xperia 10 II 外觀介紹\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 機身尺寸 157 x 69 x 8.2mm，重量 151g； 雖然是 6 吋大螢幕手機，但 21：9 的款螢幕比例，機身兩側較窄，即使以單手握持也不會顯得過重或是握感不佳。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 搭載 6 吋 OLED 螢幕，採用 21：9 顯示比例、2,520 x 1,080pixels 解析度，螢幕四周採用圓形導角，表面覆蓋康寧大猩猩第六代玻璃。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 由於採用 21：9 顯示比例，在觀賞 2.35：1 等電影規格影片時，能將螢幕的顯示範圍利用到最完整，不會出現上下黑邊。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 雖然是採用較特殊的 21：9 比例，但大多數的遊戲仍可正常以全螢幕的方式遊玩。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲在進行類似傳說對決等遊戲時，Sony Xperia 10 II 因為 21：9 的寬螢幕可以顯示出更大的遊戲地圖視野，在進行遊戲時能更有效的掌握戰場狀況。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 前置 800 萬畫素鏡頭、F2.0 光圈，具有「肖像自拍功能」，內建景深、柔膚、亮膚、大眼、小臉等模式，可美顏同時製造景深。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 下方可使用虛擬的三顆觸控鍵，也可設定為手勢導覽操作。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 螢幕下方與中框間具有喇叭設計。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 頂部配置耳機插孔與麥克風；並具有 Hi-Res 高解析音樂與 DSEE HX 數位音質還原技術，可將 MP3 還原成 CD 音質。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 將 nano-SIM / microSD 卡托設置在機身左側；支援 4G + 4G 雙卡雙待，SIM 2 與 microSD 記憶卡為二擇一使用，最高可擴充至 1TB 儲存空間。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 右側配置音量鍵、電源鍵；電源鍵同時具有指紋辨識器功能。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Mobile 再度回歸側邊電源與指紋辨識器整合設計，能夠進行手機解鎖、APP 存取、指紋支付等功能。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 連續按壓兩次電源鍵可啟動 Google 語音助理。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 底部配置麥克風、USB Type-C 傳輸埠。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 共有「可可黑」、「奶油白」、「薄荷綠」與「莓果藍」四色；具有藍牙 5.0、NFC，內建 3,600mAh 電池，搭配 Battery Care 技術，避免手機電力已滿仍持續充電導致電池壽命損害。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 後置 1,200 萬畫素（F2.0 光圈）+ 800 萬畫素 120° 超廣角（F2.2 光圈）+ 800 萬畫素望遠（F2.4 光圈），三鏡頭組合，同時還新增了夜景模式。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 三鏡頭採用垂直排列方式，鏡頭組高出於機身，鏡頭組上方有補光燈，一旁則是 NFC 感應區。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 採用無蓋防水設計，具備 IP65 / IP68 等級防水防塵，提供清水最深 1 公尺、最長 30 分鐘的防水能力。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 盒裝內容物包括充電器、USB Type-C 傳輸線、耳機與說明文件。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 盒裝附贈 5V / 1.5A 7.5W 充電器。\r\nSony Xperia 10 II 內建功能\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 內建 App 一覽。\r\n\r\n側面感應\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱\r\n▲Sony Xperia 10 II 具 AI 側邊感應功能，可連續輕敲兩次螢幕側邊感應條呼叫出感應目錄，滑動則可返回上一頁，可透過設定調整感應橫條高度位置與不透明度等。\r\n\r\n主螢幕按鈕\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱\r\n▲Sony Xperia 10 II 預設採用三顆虛擬導覽鍵進行操作，也可更換為 Android 9 以後的作業系統原生操作方式，利用主螢幕橫條按鈕直接向上滑動可進入程式集，向上滑動並停止則可進行多工切換。\r\n\r\n分割畫面\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 支援分割畫面能多工處理，可同時觀看兩個應用程式的畫面，可分割成一直與一橫的 16：9 雙畫面，不影響程式畫面比例。\r\n\r\n電源鍵行為\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 可透過設定將連續按壓兩次電源鍵設定為 Google 語音助理或是啟動相機。\r\n\r\nBattery Care 技術\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 搭載 Battery Care 技術，可搭配用戶的就寢時間，於手機充電至 90% 電力後減緩充電速度，在起床前透過智慧調整逐步將電力充滿至 100％，避免手機電力已滿仍持續充電導致電池壽命損害。\r\n\r\n顯示技術\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱\r\n▲Sony Xperia 10 II 支援了 BRAVIA 電視科技，可依照色彩喜好設定「忠實」或是「標準」顯示模式，同時具有智慧背光，當手持觀看螢幕內容時將不會自動熄滅螢幕。\r\nSony Xperia 10 II 攝錄體驗\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 前鏡頭具有「肖像自拍功能」，可選擇景深、柔膚、亮膚、大眼、小臉等模式。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 前鏡頭開啟景深效果並搭配低、中、高柔膚效果拍攝效果。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 主相機介面上方具有補光燈、定時拍照、照片比例、曝光色溫調整、鏡頭切換與設定功能；畫面下方有模式，攝錄切換、拍照鍵與圖片庫，並增加了變焦鍵；但因手機螢幕為 21：9 所以在使用最高畫素拍照時黑邊的區域相當大，但若要填滿畫面則會讓畫素減少。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 加入全新「夜間模式」，在低光源環境下可提升照片亮度平衡，透過 AI 演算保留過曝的部分，暗部也會獲得適度的亮度提升。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 後鏡頭標準鏡頭日間拍攝效果，整體細節表現具中上水準，在天氣晴朗色彩較為飽和鮮豔，但在陰天的情況色彩表現上就比較黯淡一些。（預設狀態為智慧場景）\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 後鏡頭分別使用超廣角、一倍與兩倍光學鏡頭變焦拍攝效果。（預設狀態為智慧場景）\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 後鏡頭具有背景虛化拍攝功能，能讓拍攝的主角更突出，拍攝時會利用長焦鏡頭拍攝，因為長焦鏡頭光圈較小，太暗的場合無法順利啟用虛化效果。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 可透過 21：9 的照片比例拍攝出具有電影感的照片，但拍攝 21：9 照片時畫素會裁切減少至 700 萬畫素。（預設狀態為智慧場景）\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 室內與夜間微光拍攝效果，色彩表現忠實，在較暗的場景中，細節會被抹除得較嚴重，光線不足時常有對不到焦的問題產生。（預設狀態為智慧場景）\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 分別使用自動與夜景模式拍攝，可發現夜間模式所拍攝出的照片在燈光過曝控制、暗部的亮度與整體的清晰度都有很大的提升，但細節輪廓上還是較為鬆散。\r\n\r\nSony Xperia 10 II 4K UHD 日間錄影：\r\n\r\n\r\nSony Xperia 10 II 4K UHD 夜間錄影：\r\n\r\nSony Xperia 10 II 效能測試\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 台灣上市版本為 XQ-AU52，採用 Android 10 作業系統。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 內建 Qualcomm Snapdragon 665, 1.8GHz + 2.0GHz 八核心處理器、Adreno 610 GPU。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 台灣上市版本內建 4GB RAM / 128GB ROM；重置後，儲存空間還有約 103GB 可使用；靜置一段時間後，RAM 則有 1.3GB 能運行軟體。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 採用 eMMC 格式的內建記憶體；以 AndroBench 實測記憶體讀寫速度，連續讀取速度 298.71MB/s、連續寫入速度為 236.07MB/s。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 使用安兔兔軟體 v8.3.4 進行跑分測試，獲得 173,870 分。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 在 GeekBench 4 v4.4.0 軟體中，單核成績 1,516 分，多核 5,506 分，圖形渲染成績則為 5,221 分。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 透過 3DMark v2.0.4661 軟體測試 Sling Shot Extreme OpenGL ES 3.1、Sling Shot Extreme Vulkan、Sling Shot 三項目分別獲得 1,125、1,129 與 1,753 分。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 使用 AITuTu 評測 v1.2.25 軟體進行 AI 測試，獲得 88,561 分。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 透過 Geekbench 4 v4.4.0 電池跑分結果為 5,599 分。在運行 1 小時後，電量還有 90%；測驗至電量 1% 時，手機自動關機並結束測驗，總時長為 9 小時 21 分鐘。\r\nSony Xperia 10 II 評測結語\r\n◎ 外型：7.5 / 10 分\r\n點評：雖然擁有 6 吋螢幕，但搭配 21：9 款螢幕，使得機身較為修長，單手的握仍維持得不錯；電源鍵與指紋辨識器再度結合再一起，操作上也比上一代來得直觀方便。\r\n\r\n◎ 功能：7.5 / 10 分\r\n點評：整體功能與過去差異不大，側邊感應方便單手操作大螢幕手機，Battery Care 技術則能幫助電池維持更長的使用壽命。\r\n\r\n◎ 效能：7.5 / 10 分\r\n點評：雖然是採用中階 Qualcomm Snapdragon 665 八核心處理器，但已足以提供日常使用的效能，不過因為只有 4GB RAM，對於大型多工應用可能會較為吃力。\r\n\r\n◎ 攝錄：7.5 / 10 分\r\n點評：三鏡頭可應付不同的拍攝主題，在晴天整體表現具有中上水準，但陰天與夜晚時表現較弱，對焦也略顯緩慢，雖然多了夜景模式，但細節表現方面仍有進步的空間。\r\n\r\n◎ 其它：7.5 / 10 分\r\n點評：產品定位中階，但加入 IP65 / 68 防水防塵等級，也有 NFC，硬體配置上仍算完整。\r\n\r\n◎ 總分：37.5 / 50 ','1590583489159',1,'2020-06-04 10:23:39'),('A1591266285080','test','Touch ID經典回歸！蘋果iPhone SE二代開箱動手玩','蘋果推出新一代智慧型手機 iPhone SE，由於整體外型延續 iPhone 8 的機身設計，使經典的 Touch ID 得以回歸，同時導入 iPhone 11 系列手機的部分功能，以及規格配置。採用 4.7 吋 Retina HD 顯示器，搭載 A13 Bionic 仿生晶片、第 3 代神經網路引擎，支援 18W 快充、Qi 無線充電，具備 IP67 防塵防水等級；另有 NFC、eSIM、藍牙 5.0 與 Wi-Fi 6 等功能。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n\r\n\r\n全新 iPhone SE 採用前後單鏡頭配置，前鏡頭提供 700 萬畫素，支援 6 種人像光模式；後置 1,200 萬畫素主鏡頭，導入新一代智慧型 HDR 模式，能夠微調照片背景中的亮部與暗部細節。iPhone SE 二代共有 64GB、128GB、256GB 儲存容量版本，提供黑、白、紅款式；《SOGI 手機王》特別取得 iPhone SE 二代黑色款式，要帶大家一睹為快。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲iPhone SE 二代盒裝採用白底設計，正面印有手機圖示，整體維持蘋果一貫的簡約風格。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲iPhone SE 二代盒裝背面印有手機規格資訊。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲打開盒裝與上蓋板即可見到 iPhone SE 二代，其餘手機配件則是放置在下層區域。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲iPhone SE 二代機身尺寸 138.4 x 67.3 x 7.3mm，重量為 148g；整體握持手感相當輕巧。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲iPhone SE 二代搭載 4.7 吋 1,334 x 750pixels 解析度 Retina HD 顯示器，提供原彩顯示，具備 1,400：1 螢幕對比、P3 廣色域顯示標準，支援 Haptic Touch 觸覺回饋觸控功能。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲iPhone SE 二代螢幕上方設有 700 萬畫素鏡頭、聽筒 / 揚聲器、麥克風；鏡頭採用 F2.2 光圈，具備自然光、攝影棚燈光、輪廓光、舞台燈光、舞台燈光黑白，以及高色調燈光黑白等 6 種人像光線效果。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲iPhone SE 二代繼 iPhone X 系列導入 Face ID 以來，重新回歸 Touch ID 指紋感測器配置，支援 Apple Pay 功能。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲iPhone SE 二代可透過指紋辨識完成手機解鎖、交易前的身分認證等功能操作。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲iPhone SE 二代頂部未有任何配置；機身中框採用鋁金屬製成，搭配消光配色與圓潤的邊角設計，提供不錯的握持手感。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲iPhone SE 二代左側配置天線、靜音鍵，以及獨立式音量調節鍵。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲iPhone SE 二代右側設有天線、電源鍵與 nano-SIM 卡插槽；透過 eSIM 技術可實現 4G + 4G 雙卡雙待，支援台灣 4G 全頻、VoLTE 通話功能。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲iPhone SE 二代底部配置揚聲器、麥克風與 Lightning 連接器。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲iPhone SE 二代採用玻璃背蓋設計，具備 IP67 防塵防水等級，可在 1 公尺水中長達 30 分鐘。配色方面除了黑色款式外，另有白、紅配色。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲iPhone SE 二代提供與 iPhone 8 相同的電力續航表現，支援 18W 快充、Qi 無線充電；內建 NFC，具備 Wi-Fi 6、藍牙 5.0 功能。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲iPhone SE 二代後置 1,200 萬畫素廣角鏡頭（6P 鏡頭、OIS、F1.8 光圈）、LED 補光燈；支援 5 倍光學變焦，採用新一代照片智慧型 HDR 技術，提供紅眼校正、人像光線效果。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲iPhone SE 二代支援快錄功能，只需在拍照模式下長按快門鍵，即可進行錄影。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲iPhone SE 二代支援最高 4K 60fps 錄影模式。\r\n\r\nTouch ID經典回歸！蘋果iPhone SE二代開箱動手玩\r\n▲iPhone SE 二代盒裝僅附贈 5W 充電器，若要完整體驗手機 18W 快充，則需另外選購快充配件組。','1590583733034',1,'2020-06-04 10:24:45'),('A1591266417505','test2','一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測','三星全新發表 Galaxy S20 系列旗艦手機，其中規格配置最頂級的 SAMSUNG Galaxy S20 Ultra，不僅效能表現傑出，攝錄方面更是突破以往，後置 1.08 億畫素 79° 廣角 + 4,800 萬畫素遠距 + 1,200 萬畫素 120° 超廣角 + 30 萬畫素 ToF 景深四鏡頭主相機，支援 10 倍混合光學變焦、100 倍 AI 超高解析度變焦，首度加入 8K 錄影、一鍵拍錄等功能；前置鏡頭則有 4,000 萬畫素，具備人像美肌、廣角自拍等模式。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n\r\n\r\n從 SAMSUNG Galaxy S20 Ultra 創新的攝錄功能，以及專業級的鏡頭配置，能夠看出三星不斷朝著「手機界的單眼」進行突破。究竟 S20 Ultra 可帶來什麼樣的攝錄效果，1.08 億畫素照片、100 倍變焦、8K 錄影功能，實際表現又是如何？《SOGI 手機王》趁著台灣上市前取得 S20 Ultra 歐版，重點實測相機十大功能應用。\r\n\r\n主相機實拍\r\n\r\n​SAMSUNG Galaxy S20 Ultra 後置四鏡頭主相機，維持 30 種 AI 場景智慧辨識，保留構圖建議功能；相機在預設的 3：4 比率下，照片解析度為 1,200 萬畫素。專業模式方面，S20 Ultra 提供「矩陣」、「中心-重點測光」、「點」等測光模式，其中快門最長可達 30 秒，相比於 S10 系列的 10 秒快門更有利於光軌的拍攝。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 後鏡頭相片、專業模式拍攝介面；專業模式下可調整 3：4、9：16、1：1、Full 等比率，但不支援 1.08 億畫素拍攝。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 延續 S10 系列的構圖建議功能，預設為關閉狀態，用戶可依需求自行開啟使用。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 日間拍攝效果實測（狀態為 HDR 自動、場景智慧辨識開啟）。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 夜間拍攝效果實測（狀態為 HDR 自動、場景智慧辨識開啟）。\r\n\r\n1.08 億畫素\r\n\r\nSAMSUNG Galaxy S20 Ultra 首度搭載三星 ISOCELL Bright HM1 感光元件，可拍攝最高 1.08 億畫素照片；雖然在 1.08 億畫素模式下，僅可拍攝 3：4 比率的照片，但仍保留 AI 場景智慧辨識功能。另外，S20 Ultra 支援快速截取圖標功能，可將 1.08 億畫素照片進行局部裁切，並儲存為 3,300 萬畫素的高解析照片使用。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 在 1.08 億畫素模式下僅提供 3：4 拍攝比率。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 開啟 1.08 億畫素拍攝前後差異。\r\n\r\n百倍變焦\r\n\r\nSAMSUNG Galaxy S20 Ultra 後置 4,800 萬畫素遠距鏡頭，透過摺疊式鏡頭設計與 AI 強化技術，支援 10 倍混合光學變焦、100 倍 AI 超高解析度變焦功能。其中 1 至 4 倍焦距，是由 1.08 億畫素主鏡頭負責拍攝；4 倍以上焦距，則由 4,800 萬畫素遠距鏡頭處理。另外，100 倍變焦模式下，系統雖會透過 AI 技術修補畫面的流失細節，但也會造成過重的油畫感。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 變焦至 20 倍以上時，拍攝介面右上角會出現預覽視覺，可有效協助用戶進行物件追蹤，了解鏡頭的拍攝位置。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 遠距鏡頭依序使用 1 倍、10 倍、30 倍、60 倍、100 倍變焦效果實測。\r\n\r\n120 度超廣角\r\n\r\nSAMSUNG Galaxy S20 Ultra 主相機提供 1,200 萬畫素 120 度超廣角鏡頭，雖然相比 S10 系列的 1,600 萬畫素 123 度超廣角，由於採用不同的感光元件配置，不僅畫素方面有所調降，超廣角角度也有微幅調整；但整體拍攝表現並不遜色於前代 S10 系列手機。此外，S20 Ultra 超廣角鏡頭具備 OIS 光學防手震，更能保有穩定的成像表現。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 提供 0.5 倍超廣角拍攝模式；與 1 倍焦距相比，會有些微的色調偏差，但差異不會過於明顯。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 開啟超廣角模式前後拍攝差異（狀態為 HDR 自動、場景智慧辨識開啟）。\r\n\r\n景深即時預覽\r\n\r\nSAMSUNG Galaxy S20 Ultra 內建景深即時預覽功能，除了延續 S10 系列既有的柔焦、縮放、顯色（S20 系列定名為抽色）外，更新增了散景效果。其中散景效果需要偵測至人臉才會成功觸發，其餘效果則除了人臉外，同樣可套用至其他物件上。此外，針對非人物件或是主體不夠明確者，抽色效果的判定範圍表現較差。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 提供柔焦、散景、旋轉、縮放、抽色共 5 種景深即時預覽效果。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 使用景深即時預覽無、柔焦、散景、旋轉、縮放、抽色等效果實測（狀態為 HDR 自動、景深強度為 5）。\r\n\r\n夜間模式\r\n\r\nSAMSUNG Galaxy S20 Ultra 首度支援 Nona-binning 九合一畫素技術，開啟夜間模式後，系統會將 9 個像素合併成單一像素，並輸出成 2.4μm 尺寸的 1,200 萬畫素照片。手機處在低光源環境時，系統會自動提示是否開啟夜間模式，並在預覽畫面右下角，提供 30 秒以內的預判曝光時間。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 開啟夜間模式後，經系統判定符合啟動條件時，會在預覽畫面右下角顯示曝光時間。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 實測夜間模式開啟前後差異。\r\n\r\n8K 錄影\r\n\r\nSAMSUNG Galaxy S20 Ultra 首度支援 8K 解析度錄影（最高 30FPS），可錄製 7,680 x 4,320pixels 解析度的影片，同時支援快速截取圖標功能，可在影片任一時間點擷取 3,300 萬畫素解析度照片。另外，8K 錄影模式下，僅提供 9：16 影片比率，不支援追蹤自動對焦、影片特效、影片防手震等功能。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 8K 錄影僅提供 9：16 影片比率可選。\r\n\r\nSAMSUNG Galaxy S20 Ultra 日間 8K 錄影：\r\n\r\n\r\nSAMSUNG Galaxy S20 Ultra 夜間 8K 錄影：\r\n\r\n\r\n超穩定動態攝影\r\n\r\nSAMSUNG Galaxy S20 Ultra 保留超穩定動態攝影功能，並將畫面影格率提升至最高 60FPS；開啟後，雖僅支援 9：16 影片比率，但能大幅度維持畫面穩定性，同時支援一般與廣角模式切換。超穩定動態攝影除了可加強相機錄影的實用性，無須透過第三方穩定器具，也能享有高品質的錄影表現，對於喜愛記錄生活，拍攝 Vlog 的用戶而言相當實用。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 除了提供進階版的超穩定動態攝影，同時具備專業影片功能，可針對影片錄製需求，自行調整相機參數。\r\n\r\nSAMSUNG Galaxy S20 Ultra 超穩定動態攝影（關）：\r\n\r\n\r\nSAMSUNG Galaxy S20 Ultra 超穩定動態攝影（開）：\r\n\r\n\r\nSAMSUNG Galaxy S20 Ultra 日間 4K UHD 60fps 錄影：\r\n\r\n\r\nSAMSUNG Galaxy S20 Ultra 夜間 4K UHD 60fps 錄影：\r\n\r\n\r\n一鍵拍錄\r\n\r\nSAMSUNG Galaxy S20 Ultra 新增一鍵拍錄功能，系統會同時運作多組鏡頭，並且依據當前拍攝環境，最少錄製 2 部影片、最多 4 部影片與 10 張照片，同時搭配 AI 運算自動將影片剪輯成 10 秒的片段；而一鍵拍錄功能下所拍攝的照片，也會各自套用不同的照片效果與濾鏡模式。但每次拍錄時，並不能掌握系統錄製的影片數量、照片張數，整體而言可控性較低。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 進行一鍵拍錄後，會在照片預覽圖右下角，顯示拍攝照片與影片的總數量。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n\r\n\r\n\r\n\r\n\r\n\r\n▲SAMSUNG Galaxy S20 Ultra 一鍵拍錄效果實測（5 張照片 + 3 部影片）。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n\r\n\r\n\r\n\r\n\r\n\r\n▲SAMSUNG Galaxy S20 Ultra 一鍵拍錄效果實測（6 張照片 + 3 部影片）。\r\n\r\n人像美肌\r\n\r\nSAMSUNG Galaxy S20 Ultra 前置 4,000 萬畫素鏡頭（F2.2 光圈），雖然相比 S10+ 僅採用單鏡頭配置，但整體拍攝效果表現不差；4,000 萬畫素也可帶來更細緻的拍攝細節，具備美肌、濾鏡拍攝模式。另外，前鏡頭支援智慧自拍角度功能，只要在相機預覽介面同時出現 2 個人，系統會自動偵測並切換至廣角自拍模式。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 前鏡頭支援平滑度、膚色、下顎輪廓、大眼等美肌模式。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 前鏡頭開啟平滑度 0、3、6、8 效果實測（狀態為 HDR 自動）。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 前鏡頭開啟膚色 0、1、3、4 效果實測（狀態為 HDR 自動）。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 前鏡頭開啟下顎輪廓 0、3、6、8 效果實測（狀態為 HDR 自動）。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 前鏡頭開啟大眼 0、3、6、8 效果實測（狀態為 HDR 自動）。\r\n\r\n一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測一億畫素、百倍變焦！三星S20 Ultra十大相機功能速測\r\n▲SAMSUNG Galaxy S20 Ultra 前鏡頭開啟自拍廣角前後差異（狀態為 HDR 自動）。\r\n【三星 Galaxy S20 Ultra 評價】\r\n◎ 攝錄：9.5 / 10 分\r\nSAMSUNG Galaxy S20 Ultra 攝錄表現著實令人驚艷，經實測 100 倍變焦在光線充足的情況下，大多都能成功辨識拍攝物件，而在低光環境下由於 AI 會自動進行畫面補強，反而造成過重的油墨感；整體來說，10 倍以內的混合變焦，同時具備望遠與清晰兩大優勢，對於日常記錄生活、專業攝影，都能有相當亮眼的表現。\r\n\r\n另外，SAMSUNG Galaxy S20 Ultra 雖然支援 8K 錄影，但僅提供最高 30FPS 影格率，且一般電腦設備預設的影音播放軟體，並不支援 8K 影片格式的播放；若非特殊用途，或是使用快速截取圖標功能進行截圖，一般仍建議使用 4K 60FPS 錄影，整體表現會更加實用。','1591170817533',1,'2020-06-04 10:26:58'),('A1591266511619','test2','外觀與規格比一比 SAMSUNG S20全系列5G手機開箱','三星 Galaxy S20 旗艦系列手機，台灣完全引進支援 5G 的版本，全系列除了擁有 6.2 吋 S20 與 6.7 吋 S20+ 之外，更針對專業級用戶推出 6.9 吋 S20 Ultra；規格方面，同樣採用 Dynamic AMOLED 2X 螢幕，支援最高 120Hz 螢幕更新率，搭載 Qualcomm Snapdragon 865 行動平台，具備 IP68 防塵防水等級，另有 Wi-Fi 6、藍牙 5.0、NFC，以及雙卡雙待等功能。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n\r\n\r\n相機方面，SAMSUNG Galaxy S20、S20+ 分別採用 6,400 萬畫素三鏡頭、四鏡頭的配置，而 S20 Ultra 則是搭載最高畫素 1.08 億的四鏡頭主相機；全系列支援 8K 錄影、夜間縮時錄影功能。我們特別取得 SAMSUNG Galaxy S20 全系列台灣上市版本，除了要帶大家細看三款手機的外觀設計，同時也要針對規格差異進行比較。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n▲SAMSUNG Galaxy S20 系列採用相同的盒裝風格，中心處「S20」字樣延伸至盒裝兩側邊緣，呼應手機的曲面螢幕設計，從最下面的型號標示可以清楚看出盒裝內的手機為何。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n▲圖片左起為 SAMSUNG Galaxy S20、S20+、S20 Ultra，分別搭載 6.2 吋、6.7 吋、6.9 吋 Quad HD+ 螢幕，全系列採用 20：9 顯示比例，也都支援高達 120Hz 的螢幕更新率。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n▲SAMSUNG Galaxy S20 系列採用 Dynamic AMOLED 2X 顯示技術，具備 HDR10+ 認證，相比 S10 系列可減少螢幕藍光達 18%。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n▲SAMSUNG Galaxy S20 系列選用置中 O 極限全螢幕設計；其中 S20、S20+ 前置 1,000 萬畫素鏡頭，而 S20 Ultra 則搭載 4,000 萬畫素前鏡頭，三者同樣採用 F2.2 光圈，具備 80° 廣角。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n▲SAMSUNG Galaxy S20 系列採用虛擬導覽列設計；螢幕佔比部分，S20、S20+、S20 Ultra 分別為 93.2%、93.7%、94.2%。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n▲SAMSUNG Galaxy S20 系列頂部配置麥克風、天線、nano-SIM 卡槽；聽筒（揚聲器）則配置在螢幕與邊框的交界處。其中 S20 Ultra（下）的麥克風位置，相較 S20、S20+ 更接近右側邊框。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n▲SAMSUNG Galaxy S20 系列採用三選二卡插槽設計（卡托皆為相同配色），具備 4G + 4G 雙卡雙待、microSD 記憶卡擴充，未來可升級為 5G + 4G 雙卡雙待。5G 連網方面，台灣上市版本支援 Sub-6、NSA，但不具備 mmWave 與 SA。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n▲SAMSUNG Galaxy S20 系列左側除了一組天線配置外，並未設置任何實體按鍵。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n▲SAMSUNG Galaxy S20 系列右側同樣設有天線、音量調節鍵與電源鍵（Bixby 鍵）。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n▲SAMSUNG Galaxy S20 系列底部設有雙天線、麥克風、USB Type-C 傳輸埠，以及獲得 AKG 專業調校的喇叭。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n▲SAMSUNG Galaxy S20 系列台灣上市版本，除了同樣具備「星空灰」款式外，S20 另有「晴空粉」、「晴空藍」，S20+ 尚有「星空黑」、「晴空藍」、「晴空白」，而 S20 Ultra 還有「星空黑」款式可選。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n▲SAMSUNG Galaxy S20、S20+、S20 Ultra 分別配置 4,000mAh、4,500mAh、5,000mAh 電量，S20、S20+ 支援 25W 閃電快充，S20 Ultra 支援 45W 閃電快充；全系列具備 15W 無線閃充、無線電力分享功能。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n▲SAMSUNG Galaxy S20 系列後鏡頭採用矩陣排列設計，其中 S20 後置 6,400 萬畫素三鏡頭，S20+ 後置 6,400 萬畫素四鏡頭，S20 Ultra 後置 1.08 億畫素四鏡頭主相機。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n▲SAMSUNG Galaxy S20 後置 6,400 萬畫素長焦（F2.0 光圈）+ 1,200 萬畫素 120° 超廣角（F2.2 光圈）+ 1,200 萬畫素（F1.8 光圈）三鏡頭，支援 3 倍混合光學變焦、30 倍數位變焦功能。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n▲SAMSUNG Galaxy S20+ 後置 6,400 萬畫素長焦（F2.0 光圈）+ 1,200 萬畫素 120° 超廣角（F2.2 光圈）+ 1,200 萬畫素（F1.8 光圈）+ ToF 景深四鏡頭，支援 3 倍混合光學變焦、30 倍數位變焦功能。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n▲SAMSUNG Galaxy S20 Ultra 後置 1 億 800 萬畫素（F1.8 光圈）+ 4,800 萬畫素長焦（F3.5 光圈）+ 1,200 萬畫素 120° 超廣角（F2.2 光圈）+ ToF 景深四鏡頭，支援 10 倍混合光學變焦、100 倍數位變焦功能。\r\n\r\n外觀與規格比一比 SAMSUNG S20全系列5G手機開箱\r\n▲SAMSUNG Galaxy S20 系列盒裝配件一致，都提供了 AKG 耳機（USB Type-C）、耳塞套、25W 充電器、退卡針、USB 傳輸線、行動服務指南、快速入門指南、保證書，以及軟式保護套。\r\n\r\n三星 S20 全系列規格比較\r\n \r\n型號	Galaxy S20	Galaxy S20+	Galaxy S20 Ultra\r\n系統	Android 10 作業系統、One UI 2.1 操作介面\r\n螢幕	6.2 吋 Quad HD+ \r\nDynamic AMOLED 2X\r\n3,200 x 1440pixels\r\n563PPI\r\nHDR10+ 認證\r\n120Hz 螢幕更新率	6.7 吋 Quad HD+\r\nDynamic AMOLED 2X\r\n3,200 x 1440pixels\r\n525PPI\r\nHDR10+ 認證\r\n120Hz 螢幕更新率	6.9 吋 Quad HD+\r\nDynamic AMOLED 2X\r\n3,200 x 1440pixels\r\n511PPI\r\nHDR10+ 認證\r\n120Hz 螢幕更新率\r\n處理器	Qualcomm Snapdragon 865 八核心\r\n（2.8GHz + 2.4GHz + 1.8GHz）\r\nRAM / ROM	12GB RAM / 128GB ROM	12GB RAM / 128GB ROM	12GB RAM / 256GB ROM\r\n16GB RAM / 512GB ROM\r\nmicroSD 擴充	最高可至 1TB\r\n前鏡頭	1,000 萬畫素\r\nDual Pixel AF\r\n80° 廣角、F2.2 光圈	4,000 萬畫素\r\nDual Pixel AF\r\n80° 廣角、F2.2 光圈\r\n後鏡頭	三鏡頭\r\n\r\n超廣角：1,200 萬畫素\r\n120° 廣角、F2.2 光圈\r\n\r\n廣角：1,200 萬畫素\r\nSuper Speed Dual Pixel AF\r\n79° 廣角、F1.8 光圈、OIS\r\n\r\n遠距：6,400 萬畫素\r\nPDAF\r\n76° 廣角、F2.0 光圈、OIS	四鏡頭\r\n\r\n超廣角：1,200 萬畫素\r\n120° 廣角、F2.2 光圈\r\n\r\n廣角：1,200 萬畫素\r\nSuper Speed Dual Pixel AF\r\n79° 廣角、F1.8 光圈、OIS\r\n\r\n遠距：6,400 萬畫素\r\nPDAF\r\n76° 廣角、F2.0 光圈、OIS\r\n\r\n景深：ToF	四鏡頭\r\n\r\n超廣角：1,200 萬畫素\r\n120° 廣角、F2.2 光圈\r\n\r\n廣角：1 億 800 萬畫素\r\n79° 廣角、F1.8 光圈、OIS\r\n\r\n遠距：4,800 萬畫素\r\nPDAF\r\n24° 廣角、F3.5 光圈、OIS\r\n\r\n景深：ToF\r\n相機功能	3 倍混合光學變焦\r\n30 倍數位變焦\r\n一鍵拍錄模式\r\n8K 高畫質攝影\r\n8K 高畫質攝影快照\r\n超穩定動態攝影\r\n夜間縮時錄影	10 倍混合光學變焦\r\n 100 倍數位變焦\r\n超清晰夜拍\r\n一鍵拍錄模式\r\n8K 高畫質攝影\r\n8K 高畫質攝影快照\r\n超穩定動態攝影\r\n夜間縮時錄影\r\n生物辨識	超聲波指紋辨識、臉部辨識\r\n5G	NR 2100 / 3500\r\nSub-6 / NSA\r\n4G	台灣 4G 全頻、5CA 載波聚合\r\n雙卡雙待	O\r\nWi-Fi	Wi-Fi 6\r\n（802.11 a/b/g/n/ac/ax 2.4G + 5GHz）\r\n HE80, MIMO, 1024-QAM\r\n下 / 上載速度最高可達 1.2Gbps\r\n電池	4,000mAh	4,500mAh	5,000mAh\r\n充電	25W 閃電快充\r\n15W 無線閃充\r\n無線電力分享	25W 閃電快充\r\n15W 無線閃充\r\n無線電力分享	45W 閃電快充\r\n15W 無線閃充\r\n無線電力分享\r\n防塵防水	IP68\r\n音源	AKG 調校雙喇叭、杜比環繞音效\r\n機身尺寸	151.7 x 69.1 x 7.9mm	161.9 x 73.7 x 7.8mm  / 186g	166.9 x 76 x 8.8mm\r\n機身重量	163g	186g	222g\r\n顏色	星空灰、晴空藍、晴空粉	星空灰、星空黑、晴空藍、晴空白	星空灰（512GB）\r\n星空黑（256GB、512GB）\r\n建議售價	32,900 元	36,900 元	43,900 元\r\n47,900 元','1591170605467',1,'2020-06-04 10:28:32'),('A1591539470085','test','testtest','dfasdfasdf','1590583489159',0,'2020-06-07 14:17:50'),('A1591539605210','test','test33333哈哈哈','asdfasdf哈哈哈','1590583489159',0,'2020-06-07 14:20:05');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `Company_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Company_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Contact_Person` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Address` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Company_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `Delivery_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Date` date NOT NULL,
  `Total_Price` int(11) NOT NULL,
  `Progress` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LP_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Delivery_ID`),
  KEY `Delivery_FK` (`LP_ID`),
  CONSTRAINT `Delivery_FK` FOREIGN KEY (`LP_ID`) REFERENCES `logistics_provider` (`LP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_detail`
--

DROP TABLE IF EXISTS `delivery_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_detail` (
  `Delivery_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Detail_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Product_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Price` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`Detail_ID`),
  KEY `Delivery_Detail_FK` (`Delivery_ID`),
  KEY `Delivery_Detail_FK1` (`Product_ID`),
  CONSTRAINT `Delivery_Detail_FK` FOREIGN KEY (`Delivery_ID`) REFERENCES `delivery` (`Delivery_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Delivery_Detail_FK1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_detail`
--

LOCK TABLES `delivery_detail` WRITE;
/*!40000 ALTER TABLE `delivery_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logistics_provider`
--

DROP TABLE IF EXISTS `logistics_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logistics_provider` (
  `LP_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LP_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Contact_Person` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Address` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`LP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistics_provider`
--

LOCK TABLES `logistics_provider` WRITE;
/*!40000 ALTER TABLE `logistics_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `logistics_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `Member_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Member_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Gender` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Address` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Phone` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Password` varchar(64) COLLATE utf8_bin NOT NULL,
  `Email` varchar(100) COLLATE utf8_bin NOT NULL,
  `Salt` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`Member_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('test','Test','male','test road','0912345678','0f34ae402d6648a3e3220317954fa78bd44dc430fcbfcbdfbc4c1fe6ee7dd51f','test@test','52b4465077f788bbf71dec2182b54a64db3518afd71ba4c6689e8adec5c0c1b9'),('test2','Test2','female','test2 road','0987654321','aadbb06504398de1255d331d657cef51dd17f46363132af9596bad1ed064e797','test2@test2','8bd755d09ab307c615ac307a0ad3a8fbe3ce3044e4748bf6ef21a6b2d46e481d');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `Order_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Total_Price` int(11) NOT NULL,
  `Member_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Delivery_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `Order_FK` (`Member_ID`),
  KEY `Order_FK1` (`Delivery_ID`),
  CONSTRAINT `Order_FK` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Order_FK1` FOREIGN KEY (`Delivery_ID`) REFERENCES `delivery` (`Delivery_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `Order_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Detail_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Product_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Price` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`Detail_ID`),
  KEY `Order_Detail_FK` (`Order_ID`),
  KEY `Order_Detail_FK1` (`Product_ID`),
  CONSTRAINT `Order_Detail_FK` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Order_Detail_FK1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing`
--

DROP TABLE IF EXISTS `packing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing` (
  `Packing_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Packing_Date` date NOT NULL,
  `Total_Price` int(11) NOT NULL,
  `LP_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Member_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Order_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Packing_ID`),
  KEY `Packing_List_FK` (`LP_ID`),
  KEY `Packing_List_FK1` (`Member_ID`),
  KEY `Packing_List_FK2` (`Order_ID`),
  CONSTRAINT `Packing_List_FK` FOREIGN KEY (`LP_ID`) REFERENCES `logistics_provider` (`LP_ID`),
  CONSTRAINT `Packing_List_FK1` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`),
  CONSTRAINT `Packing_List_FK2` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing`
--

LOCK TABLES `packing` WRITE;
/*!40000 ALTER TABLE `packing` DISABLE KEYS */;
/*!40000 ALTER TABLE `packing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_detail`
--

DROP TABLE IF EXISTS `packing_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_detail` (
  `Packing_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Detail_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Product_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Price` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`Detail_ID`),
  KEY `Packing_Detail_FK` (`Packing_ID`),
  KEY `Packing_Detail_FK1` (`Product_ID`),
  CONSTRAINT `Packing_Detail_FK` FOREIGN KEY (`Packing_ID`) REFERENCES `packing` (`Packing_ID`),
  CONSTRAINT `Packing_Detail_FK1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_detail`
--

LOCK TABLES `packing_detail` WRITE;
/*!40000 ALTER TABLE `packing_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `packing_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_detail`
--

DROP TABLE IF EXISTS `payment_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_detail` (
  `Payment_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Payment_Method` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Price` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Member_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `Payment_Detail_FK` (`Member_ID`),
  CONSTRAINT `Payment_Detail_FK` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_detail`
--

LOCK TABLES `payment_detail` WRITE;
/*!40000 ALTER TABLE `payment_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Model_Number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Price` int(11) NOT NULL,
  `Manufacturer` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `System` varchar(50) COLLATE utf8_bin NOT NULL,
  `Image` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Screen_Size` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Storage` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('1590583489159','Sony Xperia 10 II','XQ-AU51',10700,'Sony Mobile','Android 10','img\\xperia10II.jpg','6\"','128GB'),('1590583733034','Apple iPhone SE (2020)','A2296',13400,'Apple','iOS 13','img\\Apple iPhone SE (2020).jpg','4.7\"','64GB'),('1591170605467','SAMSUNG Galaxy S20','SM-G981',23600,'Samsung Electronics','Android 10','img\\SAMSUNG_Galaxy_S20_5G.jpg','6.2\"','128G'),('1591170817533','SAMSUNG Galaxy S20 Ultra','SM-G988',32700,'Samsung Electronics','Android 10','img\\SAMSUNG_Galaxy_S20_Ultra.jpg','6.9\"','256G'),('1591171256596','Apple iPhone 11 128GB','iPhone 11',23590,'Apple','iOS 13','img\\iPhone11.jpg','6.1\"','128G'),('1591171426029','Sony Xperia 1','J8110',21200,'Sony Mobile','Android 9.0','img\\xperia1.jpg','6.5\"','128G');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_detail`
--

DROP TABLE IF EXISTS `product_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_detail` (
  `Product_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Detail_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Spec_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Spec_Para` float NOT NULL,
  `Unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Detail_ID`),
  KEY `Product_ID` (`Product_ID`),
  CONSTRAINT `Product_Detail_FK` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_detail`
--

LOCK TABLES `product_detail` WRITE;
/*!40000 ALTER TABLE `product_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_record`
--

DROP TABLE IF EXISTS `search_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_record` (
  `Date_Time` datetime NOT NULL,
  `Member_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Search_Content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Date_Time`),
  KEY `Search_Record_FK` (`Member_ID`),
  CONSTRAINT `Search_Record_FK` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_record`
--

LOCK TABLES `search_record` WRITE;
/*!40000 ALTER TABLE `search_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-08  9:16:01
