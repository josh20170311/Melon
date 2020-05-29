CREATE DATABASE  IF NOT EXISTS `melon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `melon`;
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
  CONSTRAINT `AD_Place_FK1` FOREIGN KEY (`Company_ID`) REFERENCES `company_list` (`Company_ID`)
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
INSERT INTO `article` VALUES ('A1590667477322','test','三鏡頭防水中階手機 Sony Xperia 10 II開箱','Sony Mobile 最新推出的中階手機 Xperia 10 II，主打 6 吋 21：9 比例 OLED 寬螢幕，台灣上市規格搭載 Qualcomm Snapdragon 665，內建 4GB RAM / 128GB ROM、3,600mAh 電池，提供智慧充電技術，可同步調整充電速率，確保電池不超載，同時還增加 IP65 / 68 防水防塵等級。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱\r\n相機方面，Sony Xperia 10 II 後置獨立三鏡頭，採用 1,200 萬畫素標準、800 萬畫素超廣角、800 萬畫素望遠的三鏡頭組合，支援 4K 影片與 120fps 慢動作影片錄製，內建美食、肖像，並且增加了夜景模式，在低光源環境，也能捕捉清晰影像；前置鏡頭則是只有 800 萬畫素。\r\n\r\n\r\nSony Xperia 10 II 重點規格\r\n系統	Android 10\r\n雙卡雙待	4G + 4G\r\n尺寸 / 重量	157 x 69 x 8.2mm / 151g\r\n螢幕	6 吋 FHD+ OLED\r\n處理器	Qualcomm Snapdragon 665 八核心\r\nRAM / ROM	4GB RAM / 128GB\r\n前鏡頭	800 萬畫素（F2.0 光圈）\r\n後鏡頭	1,200 萬畫素（F2.0 光圈）\r\n800 萬畫素望遠（F2.4 光圈）\r\n800 萬畫素超廣角（F2.2 光圈）\r\nLED 補光燈\r\n電池	3,600 mAh（不可拆卸）\r\n特色功能	側面感應、肖像自拍、夜景模式、IP65 / IP68 防水防塵、Battery Care\r\nSony Xperia 10 II 外觀介紹\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 機身尺寸 157 x 69 x 8.2mm，重量 151g； 雖然是 6 吋大螢幕手機，但 21：9 的款螢幕比例，機身兩側較窄，即使以單手握持也不會顯得過重或是握感不佳。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 搭載 6 吋 OLED 螢幕，採用 21：9 顯示比例、2,520 x 1,080pixels 解析度，螢幕四周採用圓形導角，表面覆蓋康寧大猩猩第六代玻璃。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 由於採用 21：9 顯示比例，在觀賞 2.35：1 等電影規格影片時，能將螢幕的顯示範圍利用到最完整，不會出現上下黑邊。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 雖然是採用較特殊的 21：9 比例，但大多數的遊戲仍可正常以全螢幕的方式遊玩。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲在進行類似傳說對決等遊戲時，Sony Xperia 10 II 因為 21：9 的寬螢幕可以顯示出更大的遊戲地圖視野，在進行遊戲時能更有效的掌握戰場狀況。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 前置 800 萬畫素鏡頭、F2.0 光圈，具有「肖像自拍功能」，內建景深、柔膚、亮膚、大眼、小臉等模式，可美顏同時製造景深。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 下方可使用虛擬的三顆觸控鍵，也可設定為手勢導覽操作。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 螢幕下方與中框間具有喇叭設計。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 頂部配置耳機插孔與麥克風；並具有 Hi-Res 高解析音樂與 DSEE HX 數位音質還原技術，可將 MP3 還原成 CD 音質。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 將 nano-SIM / microSD 卡托設置在機身左側；支援 4G + 4G 雙卡雙待，SIM 2 與 microSD 記憶卡為二擇一使用，最高可擴充至 1TB 儲存空間。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 右側配置音量鍵、電源鍵；電源鍵同時具有指紋辨識器功能。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Mobile 再度回歸側邊電源與指紋辨識器整合設計，能夠進行手機解鎖、APP 存取、指紋支付等功能。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 連續按壓兩次電源鍵可啟動 Google 語音助理。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 底部配置麥克風、USB Type-C 傳輸埠。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 共有「可可黑」、「奶油白」、「薄荷綠」與「莓果藍」四色；具有藍牙 5.0、NFC，內建 3,600mAh 電池，搭配 Battery Care 技術，避免手機電力已滿仍持續充電導致電池壽命損害。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 後置 1,200 萬畫素（F2.0 光圈）+ 800 萬畫素 120° 超廣角（F2.2 光圈）+ 800 萬畫素望遠（F2.4 光圈），三鏡頭組合，同時還新增了夜景模式。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 三鏡頭採用垂直排列方式，鏡頭組高出於機身，鏡頭組上方有補光燈，一旁則是 NFC 感應區。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 採用無蓋防水設計，具備 IP65 / IP68 等級防水防塵，提供清水最深 1 公尺、最長 30 分鐘的防水能力。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 盒裝內容物包括充電器、USB Type-C 傳輸線、耳機與說明文件。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 盒裝附贈 5V / 1.5A 7.5W 充電器。\r\nSony Xperia 10 II 內建功能\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 內建 App 一覽。\r\n\r\n側面感應\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱\r\n▲Sony Xperia 10 II 具 AI 側邊感應功能，可連續輕敲兩次螢幕側邊感應條呼叫出感應目錄，滑動則可返回上一頁，可透過設定調整感應橫條高度位置與不透明度等。\r\n\r\n主螢幕按鈕\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱\r\n▲Sony Xperia 10 II 預設採用三顆虛擬導覽鍵進行操作，也可更換為 Android 9 以後的作業系統原生操作方式，利用主螢幕橫條按鈕直接向上滑動可進入程式集，向上滑動並停止則可進行多工切換。\r\n\r\n分割畫面\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 支援分割畫面能多工處理，可同時觀看兩個應用程式的畫面，可分割成一直與一橫的 16：9 雙畫面，不影響程式畫面比例。\r\n\r\n電源鍵行為\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 可透過設定將連續按壓兩次電源鍵設定為 Google 語音助理或是啟動相機。\r\n\r\nBattery Care 技術\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 搭載 Battery Care 技術，可搭配用戶的就寢時間，於手機充電至 90% 電力後減緩充電速度，在起床前透過智慧調整逐步將電力充滿至 100％，避免手機電力已滿仍持續充電導致電池壽命損害。\r\n\r\n顯示技術\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱\r\n▲Sony Xperia 10 II 支援了 BRAVIA 電視科技，可依照色彩喜好設定「忠實」或是「標準」顯示模式，同時具有智慧背光，當手持觀看螢幕內容時將不會自動熄滅螢幕。\r\nSony Xperia 10 II 攝錄體驗\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 前鏡頭具有「肖像自拍功能」，可選擇景深、柔膚、亮膚、大眼、小臉等模式。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 前鏡頭開啟景深效果並搭配低、中、高柔膚效果拍攝效果。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 主相機介面上方具有補光燈、定時拍照、照片比例、曝光色溫調整、鏡頭切換與設定功能；畫面下方有模式，攝錄切換、拍照鍵與圖片庫，並增加了變焦鍵；但因手機螢幕為 21：9 所以在使用最高畫素拍照時黑邊的區域相當大，但若要填滿畫面則會讓畫素減少。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 加入全新「夜間模式」，在低光源環境下可提升照片亮度平衡，透過 AI 演算保留過曝的部分，暗部也會獲得適度的亮度提升。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 後鏡頭標準鏡頭日間拍攝效果，整體細節表現具中上水準，在天氣晴朗色彩較為飽和鮮豔，但在陰天的情況色彩表現上就比較黯淡一些。（預設狀態為智慧場景）\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 後鏡頭分別使用超廣角、一倍與兩倍光學鏡頭變焦拍攝效果。（預設狀態為智慧場景）\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 後鏡頭具有背景虛化拍攝功能，能讓拍攝的主角更突出，拍攝時會利用長焦鏡頭拍攝，因為長焦鏡頭光圈較小，太暗的場合無法順利啟用虛化效果。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 可透過 21：9 的照片比例拍攝出具有電影感的照片，但拍攝 21：9 照片時畫素會裁切減少至 700 萬畫素。（預設狀態為智慧場景）\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 室內與夜間微光拍攝效果，色彩表現忠實，在較暗的場景中，細節會被抹除得較嚴重，光線不足時常有對不到焦的問題產生。（預設狀態為智慧場景）\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 分別使用自動與夜景模式拍攝，可發現夜間模式所拍攝出的照片在燈光過曝控制、暗部的亮度與整體的清晰度都有很大的提升，但細節輪廓上還是較為鬆散。\r\n\r\nSony Xperia 10 II 4K UHD 日間錄影：\r\n\r\n\r\nSony Xperia 10 II 4K UHD 夜間錄影：\r\n\r\nSony Xperia 10 II 效能測試\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 台灣上市版本為 XQ-AU52，採用 Android 10 作業系統。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 內建 Qualcomm Snapdragon 665, 1.8GHz + 2.0GHz 八核心處理器、Adreno 610 GPU。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 台灣上市版本內建 4GB RAM / 128GB ROM；重置後，儲存空間還有約 103GB 可使用；靜置一段時間後，RAM 則有 1.3GB 能運行軟體。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 採用 eMMC 格式的內建記憶體；以 AndroBench 實測記憶體讀寫速度，連續讀取速度 298.71MB/s、連續寫入速度為 236.07MB/s。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 使用安兔兔軟體 v8.3.4 進行跑分測試，獲得 173,870 分。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 在 GeekBench 4 v4.4.0 軟體中，單核成績 1,516 分，多核 5,506 分，圖形渲染成績則為 5,221 分。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 透過 3DMark v2.0.4661 軟體測試 Sling Shot Extreme OpenGL ES 3.1、Sling Shot Extreme Vulkan、Sling Shot 三項目分別獲得 1,125、1,129 與 1,753 分。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 使用 AITuTu 評測 v1.2.25 軟體進行 AI 測試，獲得 88,561 分。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 透過 Geekbench 4 v4.4.0 電池跑分結果為 5,599 分。在運行 1 小時後，電量還有 90%；測驗至電量 1% 時，手機自動關機並結束測驗，總時長為 9 小時 21 分鐘。\r\nSony Xperia 10 II 評測結語\r\n◎ 外型：7.5 / 10 分\r\n點評：雖然擁有 6 吋螢幕，但搭配 21：9 款螢幕，使得機身較為修長，單手的握仍維持得不錯；電源鍵與指紋辨識器再度結合再一起，操作上也比上一代來得直觀方便。\r\n\r\n◎ 功能：7.5 / 10 分\r\n點評：整體功能與過去差異不大，側邊感應方便單手操作大螢幕手機，Battery Care 技術則能幫助電池維持更長的使用壽命。\r\n\r\n◎ 效能：7.5 / 10 分\r\n點評：雖然是採用中階 Qualcomm Snapdragon 665 八核心處理器，但已足以提供日常使用的效能，不過因為只有 4GB RAM，對於大型多工應用可能會較為吃力。\r\n\r\n◎ 攝錄：7.5 / 10 分\r\n點評：三鏡頭可應付不同的拍攝主題，在晴天整體表現具有中上水準，但陰天與夜晚時表現較弱，對焦也略顯緩慢，雖然多了夜景模式，但細節表現方面仍有進步的空間。\r\n\r\n◎ 其它：7.5 / 10 分\r\n點評：產品定位中階，但加入 IP65 / 68 防水防塵等級，也有 NFC，硬體配置上仍算完整。\r\n\r\n◎ 總分：37.5 / 50','1590583489159',0,'2020-05-28 12:04:37');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_list`
--

DROP TABLE IF EXISTS `company_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_list` (
  `Company_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Company_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Contact_Person` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Address` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Company_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_list`
--

LOCK TABLES `company_list` WRITE;
/*!40000 ALTER TABLE `company_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_list` ENABLE KEYS */;
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
  `Total_Price` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
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
  `Price` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
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
  `Password` varchar(50) COLLATE utf8_bin NOT NULL,
  `Email` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Member_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('','','','','','',''),('test','Test','male','test road','0912345678','test','test@test');
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
  `Price` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
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
-- Table structure for table `packing_detail`
--

DROP TABLE IF EXISTS `packing_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_detail` (
  `Packing_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Detail_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Product_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Price` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`Detail_ID`),
  KEY `Packing_Detail_FK` (`Packing_ID`),
  KEY `Packing_Detail_FK1` (`Product_ID`),
  CONSTRAINT `Packing_Detail_FK` FOREIGN KEY (`Packing_ID`) REFERENCES `packing_list` (`Packing_ID`),
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
-- Table structure for table `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_list` (
  `Packing_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Packing_Date` date NOT NULL,
  `Total_Price` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
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
-- Dumping data for table `packing_list`
--

LOCK TABLES `packing_list` WRITE;
/*!40000 ALTER TABLE `packing_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `packing_list` ENABLE KEYS */;
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
  `Price` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
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
INSERT INTO `product` VALUES ('1590583489159','Sony Xperia 10 II','Sony Xperia 10 II',10700,'Sony Mobile','Android 10','C:\\Users\\josh\\Documents\\系統分析\\Melon\\WebContent\\img\\xperia10II.jpg','6\"','128GB'),('1590583733034','Apple iPhone SE (2020)','A2296',13400,'Apple','iOS 13','C:\\Users\\josh\\Documents\\系統分析\\Melon\\WebContent\\img\\Apple iPhone SE (2020).jpg','4.7\"','64GB');
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

-- Dump completed on 2020-05-29 11:25:53
