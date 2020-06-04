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
INSERT INTO `article` VALUES ('A1590667477322','test','三鏡頭防水中階手機 Sony Xperia 10 II開箱','Sony Mobile 最新推出的中階手機 Xperia 10 II，主打 6 吋 21：9 比例 OLED 寬螢幕，台灣上市規格搭載 Qualcomm Snapdragon 665，內建 4GB RAM / 128GB ROM、3,600mAh 電池，提供智慧充電技術，可同步調整充電速率，確保電池不超載，同時還增加 IP65 / 68 防水防塵等級。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱\r\n相機方面，Sony Xperia 10 II 後置獨立三鏡頭，採用 1,200 萬畫素標準、800 萬畫素超廣角、800 萬畫素望遠的三鏡頭組合，支援 4K 影片與 120fps 慢動作影片錄製，內建美食、肖像，並且增加了夜景模式，在低光源環境，也能捕捉清晰影像；前置鏡頭則是只有 800 萬畫素。\r\n\r\n\r\nSony Xperia 10 II 重點規格\r\n系統	Android 10\r\n雙卡雙待	4G + 4G\r\n尺寸 / 重量	157 x 69 x 8.2mm / 151g\r\n螢幕	6 吋 FHD+ OLED\r\n處理器	Qualcomm Snapdragon 665 八核心\r\nRAM / ROM	4GB RAM / 128GB\r\n前鏡頭	800 萬畫素（F2.0 光圈）\r\n後鏡頭	1,200 萬畫素（F2.0 光圈）\r\n800 萬畫素望遠（F2.4 光圈）\r\n800 萬畫素超廣角（F2.2 光圈）\r\nLED 補光燈\r\n電池	3,600 mAh（不可拆卸）\r\n特色功能	側面感應、肖像自拍、夜景模式、IP65 / IP68 防水防塵、Battery Care\r\nSony Xperia 10 II 外觀介紹\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 機身尺寸 157 x 69 x 8.2mm，重量 151g； 雖然是 6 吋大螢幕手機，但 21：9 的款螢幕比例，機身兩側較窄，即使以單手握持也不會顯得過重或是握感不佳。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 搭載 6 吋 OLED 螢幕，採用 21：9 顯示比例、2,520 x 1,080pixels 解析度，螢幕四周採用圓形導角，表面覆蓋康寧大猩猩第六代玻璃。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 由於採用 21：9 顯示比例，在觀賞 2.35：1 等電影規格影片時，能將螢幕的顯示範圍利用到最完整，不會出現上下黑邊。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 雖然是採用較特殊的 21：9 比例，但大多數的遊戲仍可正常以全螢幕的方式遊玩。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲在進行類似傳說對決等遊戲時，Sony Xperia 10 II 因為 21：9 的寬螢幕可以顯示出更大的遊戲地圖視野，在進行遊戲時能更有效的掌握戰場狀況。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 前置 800 萬畫素鏡頭、F2.0 光圈，具有「肖像自拍功能」，內建景深、柔膚、亮膚、大眼、小臉等模式，可美顏同時製造景深。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 下方可使用虛擬的三顆觸控鍵，也可設定為手勢導覽操作。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 螢幕下方與中框間具有喇叭設計。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 頂部配置耳機插孔與麥克風；並具有 Hi-Res 高解析音樂與 DSEE HX 數位音質還原技術，可將 MP3 還原成 CD 音質。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 將 nano-SIM / microSD 卡托設置在機身左側；支援 4G + 4G 雙卡雙待，SIM 2 與 microSD 記憶卡為二擇一使用，最高可擴充至 1TB 儲存空間。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 右側配置音量鍵、電源鍵；電源鍵同時具有指紋辨識器功能。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Mobile 再度回歸側邊電源與指紋辨識器整合設計，能夠進行手機解鎖、APP 存取、指紋支付等功能。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 連續按壓兩次電源鍵可啟動 Google 語音助理。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 底部配置麥克風、USB Type-C 傳輸埠。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 共有「可可黑」、「奶油白」、「薄荷綠」與「莓果藍」四色；具有藍牙 5.0、NFC，內建 3,600mAh 電池，搭配 Battery Care 技術，避免手機電力已滿仍持續充電導致電池壽命損害。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 後置 1,200 萬畫素（F2.0 光圈）+ 800 萬畫素 120° 超廣角（F2.2 光圈）+ 800 萬畫素望遠（F2.4 光圈），三鏡頭組合，同時還新增了夜景模式。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 三鏡頭採用垂直排列方式，鏡頭組高出於機身，鏡頭組上方有補光燈，一旁則是 NFC 感應區。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 採用無蓋防水設計，具備 IP65 / IP68 等級防水防塵，提供清水最深 1 公尺、最長 30 分鐘的防水能力。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 盒裝內容物包括充電器、USB Type-C 傳輸線、耳機與說明文件。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 盒裝附贈 5V / 1.5A 7.5W 充電器。\r\nSony Xperia 10 II 內建功能\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 內建 App 一覽。\r\n\r\n側面感應\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱\r\n▲Sony Xperia 10 II 具 AI 側邊感應功能，可連續輕敲兩次螢幕側邊感應條呼叫出感應目錄，滑動則可返回上一頁，可透過設定調整感應橫條高度位置與不透明度等。\r\n\r\n主螢幕按鈕\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱\r\n▲Sony Xperia 10 II 預設採用三顆虛擬導覽鍵進行操作，也可更換為 Android 9 以後的作業系統原生操作方式，利用主螢幕橫條按鈕直接向上滑動可進入程式集，向上滑動並停止則可進行多工切換。\r\n\r\n分割畫面\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 支援分割畫面能多工處理，可同時觀看兩個應用程式的畫面，可分割成一直與一橫的 16：9 雙畫面，不影響程式畫面比例。\r\n\r\n電源鍵行為\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 可透過設定將連續按壓兩次電源鍵設定為 Google 語音助理或是啟動相機。\r\n\r\nBattery Care 技術\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 搭載 Battery Care 技術，可搭配用戶的就寢時間，於手機充電至 90% 電力後減緩充電速度，在起床前透過智慧調整逐步將電力充滿至 100％，避免手機電力已滿仍持續充電導致電池壽命損害。\r\n\r\n顯示技術\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱\r\n▲Sony Xperia 10 II 支援了 BRAVIA 電視科技，可依照色彩喜好設定「忠實」或是「標準」顯示模式，同時具有智慧背光，當手持觀看螢幕內容時將不會自動熄滅螢幕。\r\nSony Xperia 10 II 攝錄體驗\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 前鏡頭具有「肖像自拍功能」，可選擇景深、柔膚、亮膚、大眼、小臉等模式。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 前鏡頭開啟景深效果並搭配低、中、高柔膚效果拍攝效果。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 主相機介面上方具有補光燈、定時拍照、照片比例、曝光色溫調整、鏡頭切換與設定功能；畫面下方有模式，攝錄切換、拍照鍵與圖片庫，並增加了變焦鍵；但因手機螢幕為 21：9 所以在使用最高畫素拍照時黑邊的區域相當大，但若要填滿畫面則會讓畫素減少。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 加入全新「夜間模式」，在低光源環境下可提升照片亮度平衡，透過 AI 演算保留過曝的部分，暗部也會獲得適度的亮度提升。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 後鏡頭標準鏡頭日間拍攝效果，整體細節表現具中上水準，在天氣晴朗色彩較為飽和鮮豔，但在陰天的情況色彩表現上就比較黯淡一些。（預設狀態為智慧場景）\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 後鏡頭分別使用超廣角、一倍與兩倍光學鏡頭變焦拍攝效果。（預設狀態為智慧場景）\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 後鏡頭具有背景虛化拍攝功能，能讓拍攝的主角更突出，拍攝時會利用長焦鏡頭拍攝，因為長焦鏡頭光圈較小，太暗的場合無法順利啟用虛化效果。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 可透過 21：9 的照片比例拍攝出具有電影感的照片，但拍攝 21：9 照片時畫素會裁切減少至 700 萬畫素。（預設狀態為智慧場景）\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 室內與夜間微光拍攝效果，色彩表現忠實，在較暗的場景中，細節會被抹除得較嚴重，光線不足時常有對不到焦的問題產生。（預設狀態為智慧場景）\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 分別使用自動與夜景模式拍攝，可發現夜間模式所拍攝出的照片在燈光過曝控制、暗部的亮度與整體的清晰度都有很大的提升，但細節輪廓上還是較為鬆散。\r\n\r\nSony Xperia 10 II 4K UHD 日間錄影：\r\n\r\n\r\nSony Xperia 10 II 4K UHD 夜間錄影：\r\n\r\nSony Xperia 10 II 效能測試\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 台灣上市版本為 XQ-AU52，採用 Android 10 作業系統。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 內建 Qualcomm Snapdragon 665, 1.8GHz + 2.0GHz 八核心處理器、Adreno 610 GPU。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 台灣上市版本內建 4GB RAM / 128GB ROM；重置後，儲存空間還有約 103GB 可使用；靜置一段時間後，RAM 則有 1.3GB 能運行軟體。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 採用 eMMC 格式的內建記憶體；以 AndroBench 實測記憶體讀寫速度，連續讀取速度 298.71MB/s、連續寫入速度為 236.07MB/s。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 使用安兔兔軟體 v8.3.4 進行跑分測試，獲得 173,870 分。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 在 GeekBench 4 v4.4.0 軟體中，單核成績 1,516 分，多核 5,506 分，圖形渲染成績則為 5,221 分。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 透過 3DMark v2.0.4661 軟體測試 Sling Shot Extreme OpenGL ES 3.1、Sling Shot Extreme Vulkan、Sling Shot 三項目分別獲得 1,125、1,129 與 1,753 分。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 使用 AITuTu 評測 v1.2.25 軟體進行 AI 測試，獲得 88,561 分。\r\n\r\n三鏡頭防水中階手機 Sony Xperia 10 II開箱三鏡頭防水中階手機 Sony Xperia 10 II開箱▲Sony Xperia 10 II 透過 Geekbench 4 v4.4.0 電池跑分結果為 5,599 分。在運行 1 小時後，電量還有 90%；測驗至電量 1% 時，手機自動關機並結束測驗，總時長為 9 小時 21 分鐘。\r\nSony Xperia 10 II 評測結語\r\n◎ 外型：7.5 / 10 分\r\n點評：雖然擁有 6 吋螢幕，但搭配 21：9 款螢幕，使得機身較為修長，單手的握仍維持得不錯；電源鍵與指紋辨識器再度結合再一起，操作上也比上一代來得直觀方便。\r\n\r\n◎ 功能：7.5 / 10 分\r\n點評：整體功能與過去差異不大，側邊感應方便單手操作大螢幕手機，Battery Care 技術則能幫助電池維持更長的使用壽命。\r\n\r\n◎ 效能：7.5 / 10 分\r\n點評：雖然是採用中階 Qualcomm Snapdragon 665 八核心處理器，但已足以提供日常使用的效能，不過因為只有 4GB RAM，對於大型多工應用可能會較為吃力。\r\n\r\n◎ 攝錄：7.5 / 10 分\r\n點評：三鏡頭可應付不同的拍攝主題，在晴天整體表現具有中上水準，但陰天與夜晚時表現較弱，對焦也略顯緩慢，雖然多了夜景模式，但細節表現方面仍有進步的空間。\r\n\r\n◎ 其它：7.5 / 10 分\r\n點評：產品定位中階，但加入 IP65 / 68 防水防塵等級，也有 NFC，硬體配置上仍算完整。\r\n\r\n◎ 總分：37.5 / 50','1590583489159',1,'2020-05-28 12:04:37'),('A1591171618753','test','除了大小 Sony Xperia 1與Xperia 5差異還有這些','Sony Mobile 分別在今年上下半年推出 Xperia 1 與 Xperia 5 旗艦手機，兩款手機所搭載的處理器相同，皆為 Qualcomm Snapdragon 855，台灣上市版本亦是 6GB RAM / 128GB ROM。兩者在機身尺寸上則有比較大的區別，Sony Xperia 5 以較輕巧的機身與手感為主要訴求，從配置與外觀來看就像緊致型的 Xperia 1，但除此之外，兩者間究竟還有哪些差異？請看《SOGI 手機王》的整理。\r\n\r\n除了大小 Sony Xperia 1與Xperia 5差異還有這些\r\n\r\n▲Sony Xperia 5（左）與 Xperia 1（右）雖然在處理器與核心部分配置相同，但外觀、螢幕尺寸甚至是內建功能上仍有不同之處。\r\n\r\n重點整理：\r\n重點規格\r\n外觀硬體差異\r\n相機比較\r\nCinema Pro\r\n遊戲增強器\r\n智慧連線\r\n \r\n【重點規格】\r\n型號	Sony Xperia 1	Sony Xperia 5 \r\n螢幕	6.5 吋 4K HDR OLED\r\n21：9 比例	6.1 吋 FHD+ HDR OLED\r\n 21：9 比例\r\n處理器	Qualcomm Snapdragon 855 八核心\r\nRAM / ROM	6GB / 128GB\r\n儲存空間擴充	O\r\n前鏡頭	800 萬畫素（F2.0 光圈）\r\n後鏡頭	1,200 萬畫素主鏡頭（F1.6 光圈、26mm）\r\n1,200 萬畫素超廣角鏡頭（F2.4 光圈、16mm）\r\n1,200 萬畫素望遠鏡頭（F2.4 光圈、52mm）\r\nLED 補光燈\r\n雙卡雙待	4G + 4G（nano SIM）\r\n指紋辨識	側邊、開孔指紋辨識\r\nNFC	O\r\n3.5mm 耳機孔	X\r\n電池	3,330mAh	3,140mAh\r\n快速充電	PD 3.0 18W \r\n機身尺寸	167 x 72 x 8.2mm	158 x 68 x 8.2mm\r\n重量	178g	164g\r\n防水防塵	IP65 / IP68\r\n顏色款式	暮霞紫、冰雪白、夜空黑、晨霧灰	璃光藍、璃光黑、璃光灰、璃光紅\r\n建議售價	30,990 元	25,990 元\r\n上市時間	2019 年 6 月	2019 年 10 月\r\n\r\n更完整的規格比較可以參考 Sony Xperia 1 與 Xperia 5 大車拚。\r\n【外觀差異】\r\n除了大小 Sony Xperia 1與Xperia 5差異還有這些\r\n▲Sony Xperia 5（左）搭載 6.1 吋 21：9 比例 OLED 螢幕， FHD+ 2,520 x 1,080pixels 解析度 ；Xperia 1（右）配置 6.5 吋 21：9 比例 OLED 螢幕，則是採用更高的 4K 3,840 x 1,644pixels 解析度，兩者皆支援 HDR 影像強化、BT.2020 超廣色域、DCI-P3 廣色域與 D65 光源顯色標準。\r\n\r\n除了大小 Sony Xperia 1與Xperia 5差異還有這些\r\n▲Sony Xperia 5（左）與 Xperia 1（右）兩者皆前置 800 萬畫素自拍鏡頭、F2.0 光圈，搭載肖像自拍、美顏、HDR 等模式，並設有 SteadyShot 五軸防手震。\r\n\r\n除了大小 Sony Xperia 1與Xperia 5差異還有這些\r\n▲Sony Xperia 5（左）與 Xperia 1（右）採用虛擬導覽列，系統預設為主螢幕按鈕搭配手勢操作，也可至設定中開啟三顆觸控鍵使用。\r\n\r\n除了大小 Sony Xperia 1與Xperia 5差異還有這些\r\n▲Sony Xperia 5（左）與 Xperia 1（右）背蓋皆採用玻璃設計，後置三鏡頭主相機組，同時支援 NFC；前者內建 3,140mAh 電池，後者則內建 3,330mAh 電池，皆支援 PD 3.0 18W 快充。\r\n【相機比較】\r\n除了大小 Sony Xperia 1與Xperia 5差異還有這些\r\n▲Sony Xperia 5（左）與 Xperia 1（右）皆搭載 16mm 超廣角鏡頭（F2.4 光圈）+ 26mm 標準鏡頭（F1.6 光圈）+ 52mm 望遠鏡頭（F2.4 光圈）三鏡頭、LED 補光燈與 RGBC 紅外線感應器。\r\n\r\n除了大小 Sony Xperia 1與Xperia 5差異還有這些\r\n▲Sony Xperia 5（左）與 Xperia 1（右）鏡頭的排列順序略有不同，前者由上而下排序為 52mm 望遠鏡頭、26mm 鏡頭 + 16mm 超廣角鏡頭，鏡頭組靠左垂直排列；後者由上而下排序為則是 16mm 超廣角鏡頭 + 26mm 鏡頭 + 52mm 望遠鏡頭，鏡頭組置中垂直排列。\r\n\r\n除了大小 Sony Xperia 1與Xperia 5差異還有這些\r\n▲Sony Xperia 1（左）與 Xperia 5（右）拍攝介面基本上完全相同，其中 52mm 與 26mm 鏡頭更支援 Eye Autofocus 功能，系統會自動偵測並對焦於人像的雙眼，同時也具備 10FPS 的 AF/ AE 功能，能以連拍模式拍攝清晰的相片，Xperia 5 還新增了每秒高達 30 次的自動對焦 / 自動曝光計算，能更快速精準拍攝動態人物。\r\n\r\n除了大小 Sony Xperia 1與Xperia 5差異還有這些\r\n▲Sony Xperia 5 新增 Photography advice「攝影建議」，當手指擋住鏡頭或閉眼時，手機即時跳出提醒協助拍照成功率。\r\n\r\n除了大小 Sony Xperia 1與Xperia 5差異還有這些\r\n▲Sony Xperia 1（左）慢動作錄影選項中提供最高 960fps 超級慢動作錄影選項，但 Xperia 5（右）由於感光元件取消了內嵌記憶體的設計，因此在慢動作錄影僅具 120fps 慢動作錄影選項。 \r\n\r\nSony Xperia 1 960fps 超級慢動作錄影：\r\n\r\n\r\nSony Xperia 5 慢動作錄影：\r\n\r\n【Cinema Pro】\r\n除了大小 Sony Xperia 1與Xperia 5差異還有這些\r\n▲在 Cinema Pro 中，Sony Xperia 5 （下）擁有比 Xperia 1（上）更彈性的白平衡調整設定介面，還可鎖定自動白平衡的校正效果。\r\n\r\n除了大小 Sony Xperia 1與Xperia 5差異還有這些\r\n▲Sony Xperia 5 （下）擁有比 Xperia 1（上）更豐富的手動對焦應用，新增了跟焦點功能，可以快速在兩個焦間進行切換。\r\n\r\n除了大小 Sony Xperia 1與Xperia 5差異還有這些\r\n▲Sony Xperia 5 中的 Cinema Pro 現在還能設定收音的增益值，確保能收到足夠的現場音量。\r\n\r\nSony Xperia 1 Cinema Pro 自動收音效果：\r\n\r\n\r\nSony Xperia 5  Cinema Pro 收音增益值最大收音效果：\r\n\r\n【遊戲增強器】\r\n除了大小 Sony Xperia 1與Xperia 5差異還有這些\r\n▲Sony Xperia 5 遊戲增強器為了減少遊戲中的畫面干擾，此次也新增了 Xperia 1 中所沒有的功能表類型選項，從原本只有浮動圓球的造型增加下拉條選項。\r\n\r\n除了大小 Sony Xperia 1與Xperia 5差異還有這些\r\n▲Sony Xperia 5 遊戲增強器新增加支援 20FPS 連續螢幕截圖功能，並可輸出成影片動畫。\r\n\r\n除了大小 Sony Xperia 1與Xperia 5差異還有這些\r\n▲Sony Xperia 5 遊戲增強器除可進行螢幕錄影外，還可透過前鏡頭拍攝玩家，並進行收音，並由內建聲音轉換器，快速變聲，而 Xpeira 1 中也暫無此功能。\r\n【智慧連線】\r\n除了大小 Sony Xperia 1與Xperia 5差異還有這些\r\n▲Xperia 5 新增「智慧連線」功能，透過 Sony 的深度學習引擎，在預測到 Wi-Fi 可能變弱時，會自動切換到 4G 網路，而 Xperia 1 中則無此功能。\r\n\r\nSony Xperia 1 與 Xperia 5 哪一款最符合你的購機需求呢？歡迎分享！\r\n【短評】\r\nSony Xperia 1 與 Xperia 5 在核心硬體方面幾乎相同，但 Xperia 1 因為具有較大的螢幕與 4K 解析度，若是追求極致影音享受者自然是優先選擇，而 Xperia 5 雖然少了 4K 螢幕與 960fps 超級慢動作錄，單針對專業是用者來說 Cinema Pro 能更彈性專案設定，白平衡調整、更豐富的手動對焦應用，以及收音設定，具有更好的電影級專業錄影體驗。','1591171426029',1,'2020-06-03 08:06:59'),('A1591171707892','test','[網友都在問]iPhone 11系列評價與常見問題彙整','<a href=\"www.google.com\">google</a>Apple iPhone 11、iPhone 11 Pro 與 iPhone 11 Pro Max 三款蘋果手機皆支援 2 倍光學變焦，並且新增了夜間模式、錄影時的焦距切換功能；其中，iPhone 11 Pro 系列為蘋果旗下首款後置三鏡頭的手機，除了原有的 1,200 萬畫素廣角鏡頭 + 1,200 萬畫素 120° 超廣角鏡頭外，還增加 1,200 萬畫素望遠鏡頭，產品從上市至今，討論度居高不下。\r\n\r\n[網友都在問]iPhone 11系列評價與常見問題彙整\r\n\r\n\r\nApple iPhone 11 系列於 2019 年 9 月在台灣上市，距離開賣至今超過 6 個月的時間，始終是台灣熱賣的手機之一。我們特別整理網友最常對於 iPhone 11 系列提出的疑問，並以 iOS 13.4 作業系統（軟體版本 17E255）實際測試，希望能解決消費者的疑惑。\r\niPhone 11 的耗電程度？\r\n手機耗電程度依照各人使用方式有所不同，而每個人對耗電的定義也不一樣。部分網友在購買 Apple iPhone 11 前想知道手機的耗電表現為何？下面我們實際以 4G 上網並開啟 / 關閉低耗電模式進行測試，讓用戶能更加了解手機在觀看 YouTube 影片、手遊、待機 8 小時等情境下的耗電狀況，是否符合自己心目中的標準。\r\n\r\n[網友都在問]iPhone 11系列評價與常見問題彙整\r\n[網友都在問]iPhone 11系列評價與常見問題彙整\r\n▲AiPhone 11 使用 4G 網路觀看一小時 1080P 的 YouTube 影片，分別開啟、關閉低耗電模式進行測試，電量皆降低 7%。\r\n\r\n[網友都在問]iPhone 11系列評價與常見問題彙整\r\n[網友都在問]iPhone 11系列評價與常見問題彙整\r\n▲iPhone 11 使用 4G 網路玩一小時的遊戲（狂野飆車 9），分別開啟、關閉低耗電模式進行測試，電量分別降低 4%、9%。\r\n\r\n[網友都在問]iPhone 11系列評價與常見問題彙整\r\n[網友都在問]iPhone 11系列評價與常見問題彙整\r\n▲iPhone 11 使用 4G 網路待機 8 小時，分別開啟、關閉低耗電模式進行測試，電量仍維持在 100%。\r\n \r\n測試項目	觀看約一小時的 YouTube 影片	玩一小時的遊戲（狂野飆車 9）	待機 8 小時\r\n開啟低耗電模式	電量降低 7%	電量降低 4%	電量降低 0%\r\n關閉低耗電模式	電量降低 7%	電量降低 9%	電量降低 0%\r\n▲iPhone 11 在使用 4G 網路玩遊戲時，建議開啟「低耗電模式」，能擁有更好的續航體驗。\r\n使用 LINE 容易閃退？\r\n[網友都在問]iPhone 11系列評價與常見問題彙整\r\n▲iPhone 11 系列以 LINE 目前較新的軟體版本 v10.3.0 測試，容易閃退的 Bug 已獲得修正，若有相同狀況的用戶，不妨先將 APP 更新至新版後再進行體驗。\r\niPhone 11 Pro 網路相關問題\r\n有部分網友反應 iPhone 11 Pro 無論透過 Wi-Fi、4G 上網時網路品質都相當不穩定，容易出現斷線、網頁 / 影片轉圈圈等問題，我們實際測試了一天後並未出現同樣情況。如果有網路容易斷線的用戶，不妨先依照下列步驟檢查手機：\r\n至設定中移除 Wi-Fi 的網路設定後，再重新輸入 Wi-Fi 密碼。\r\n開啟「飛航模式」後再將其關閉。\r\n至設定中關閉「行動網路」後再重新啟用。\r\n將手機重新開機。\r\n將手機送回原廠進行檢測。\r\n[網友都在問]iPhone 11系列評價與常見問題彙整\r\n▲若 iPhone 11 Pro 透過 Wi-Fi 連線時遇到網路不穩定的狀況時，可至設定中移除 Wi-Fi 的網路設定後，再重新輸入 Wi-Fi 密碼。\r\n\r\n[網友都在問]iPhone 11系列評價與常見問題彙整\r\n▲若 iPhone 11 Pro 的 4G 網路容易斷線時，不妨至設定中開啟「飛航模式」後再將其關閉，或關閉「行動網路」後再重新啟用。\r\niPhone 11 系列怎麼挑？\r\nApple iPhone 11 系列新增夜間模式、錄影時的焦距切換功能，同時支援 Face ID、18W 快充、Qi 無線充電、NFC 等技術。螢幕方面，iPhone 11、iPhone 11 Pro 與 iPhone 11 Pro Max 分別搭載 6.1 吋、5.8 吋、6.5 吋；其中，iPhone 11 Pro 系列採用超 Retina XDR 顯示器，相機更具備 1,200 萬畫素望遠鏡頭，可提供 10 倍數位變焦的效果，若沒有預算上的限制，想要追求更好的拍照體驗，iPhone 11 Pro 系列或許是不錯的選擇。\r\n \r\n型號	iPhone 11	iPhone 11 Pro	iPhone 11 Pro Max\r\n寫真	[網友都在問]iPhone 11系列評價與常見問題彙整	[網友都在問]iPhone 11系列評價與常見問題彙整	[網友都在問]iPhone 11系列評價與常見問題彙整\r\n作業系統	iOS 13	iOS 13	iOS 13\r\n螢幕	6.1 吋 IPS\r\nLiquid Retina\r\n1,792 x 828pixels\r\n326ppi	5.8 吋 OLED\r\nSuper Retina XDR\r\n2,436 x 1,125pixels\r\n458ppi	6.5 吋 OLED\r\nSuper Retina XDR\r\n2,688 x 1,242pixels\r\n458ppi\r\n處理器	A13 Bionic	A13 Bionic	A13 Bionic\r\n儲存容量	64GB\r\n128GB\r\n256GB	64GB\r\n256GB\r\n512GB	64GB\r\n256GB\r\n512GB\r\n前鏡頭	1,200 萬畫素\r\nF2.2 光圈	1,200 萬畫素\r\nF2.2 光圈	1,200 萬畫素\r\nF2.2 光圈\r\n後鏡頭	1200 萬畫素廣角\r\nF1.8 光圈\r\n26mm 焦距\r\nOIS 光學防手震\r\n\r\n1200 萬畫素 120° 超廣角\r\nF2.4 光圈\r\n13mm 焦距\r\n\r\n2 倍光學變焦\r\n5 倍數位變焦	1200 萬畫素廣角\r\nF1.8 光圈\r\n26mm 焦距\r\nOIS 光學防手震\r\n\r\n1200 萬畫素 120° 超廣角\r\nF2.4 光圈\r\n 13mm 焦距\r\n\r\n1200 萬畫素望遠\r\nF2.0 光圈\r\n52mm 焦距\r\nOIS 光學防手震\r\n\r\n2 倍光學變焦\r\n10 倍數位變焦	1200 萬畫素廣角\r\nF1.8 光圈\r\n26mm 焦距\r\nOIS 光學防手震\r\n\r\n1200 萬畫素 120° 超廣角\r\nF2.4 光圈\r\n 13mm 焦距\r\n\r\n1200 萬畫素望遠\r\nF2.0 光圈\r\n52mm 焦距\r\nOIS 光學防手震\r\n\r\n2 倍光學變焦\r\n10 倍數位變焦\r\nUHD 4K 錄影	O	O	O\r\n生物辨識	Face ID	Face ID	Face ID\r\n3.5mm 耳機孔	X	X	X\r\nNFC	O	O	O\r\n藍牙	v5.0	v5.0	v5.0\r\n傳輸埠	Lightning	Lightning	Lightning\r\n快速充電	18W 快充	18W 快充	18W 快充\r\n無線充電	Qi 無線充電	Qi 無線充電	Qi 無線充電\r\n防水防塵	IP68	IP68	IP68\r\n機身尺寸	150.9 x 75.7 x 8.3mm	144 x 71.4 x 8.1 mm	158 x 77.8 x 8.1mm\r\n機身重量	194g	188g	226g\r\n機身顏色	白、紅、紫、綠、黃、黑	夜幕綠、太空灰、金、銀	夜幕綠、太空灰、金、銀\r\n上市日期	2019 年 9 月	2019 年 9 月	2019 年 9 月\r\n建議售價	24,900 元\r\n26,900 元\r\n30,400 元	35,900 元\r\n41,400 元\r\n48,400 元	39,900 元\r\n45,400 元\r\n52,400 元\r\n平均報價	23,545 元\r\n25,493 元\r\n28,537 元	31,966 元\r\n37,150 元\r\n43,031 元	35,241 元\r\n40,140 元\r\n45,953 元\r\n平均報價為 2020 年 4 月 1 日通路所提供的資訊，僅供參考。','1591171256596',1,'2020-06-03 08:08:28'),('A1591172011707','test2','三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測','在《高畫素、高變焦 SAMSUNG S20系列日間與變焦拍照比較》文章中，我們進行了主鏡頭與變焦的日間拍照測試，本篇將再進行低光與夜間拍攝的挑戰！究竟 S20、S20+ 與 S20 Ultra 這三款在相機的配置上稍有不同的手機，在對於攝影難度頗高的低光與夜間拍攝場景中是否會有顯著的拍照差異？請看實測比較！\r\n\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n相機規格\r\n型號	後鏡頭組	光圈	變焦\r\nSAMSUNG Galaxy S20	1,200 萬畫素超廣角\r\n1,200 萬畫素廣角\r\n6,400 萬畫素遠距	F2.2 光圈\r\nF1.8 光圈\r\nF2.0 光圈	3 倍混合光學變焦\r\n30 倍數位變焦\r\nSAMSUNG Galaxy S20+	1,200 萬畫素超廣角\r\n1,200 萬畫素廣角\r\n6,400 萬畫素遠距\r\nToF 景深	F2.2 光圈\r\nF1.8 光圈\r\nF2.0 光圈\r\n 	3 倍混合光學變焦\r\n30 倍數位變焦\r\nSAMSUNG Galaxy S20 Ultra	1,200 萬畫素超廣角\r\n1 億 800 萬畫素廣角\r\n4,800 萬畫素遠距\r\nToF 景深	F2.2 光圈\r\nF1.8 光圈\r\nF3.5 光圈	10 倍混合光學變焦\r\n 100 倍數位變焦\r\n夜間與低光拍照\r\n拍攝設定\r\n \r\n型號	相機預設模式	預設畫素\r\nSAMSUNG Galaxy S20	AI 場景開啟、HDR 自動	最高 1,200 萬\r\nSAMSUNG Galaxy S20+	AI 場景開啟、HDR 自動	最高 1,200 萬\r\nSAMSUNG Galaxy S20 Ultra	AI 場景開啟、HDR 自動	預設 1,200 萬（最高1 億 800 萬畫素 ）\r\n\r\n夜間與低光第一組\r\n\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n▲依序使用 SAMSUNG Galaxy S20、S20+、S20 Ultra 低光環境拍攝效果，在預設解析度拍攝下，三者整體表現接近，但若仔細觀察細節與高光的保留，S20 Ultra 更為出色一些。（拍攝狀態：開啟 AI 與自動 HDR）\r\n\r\n夜間與低光第二組\r\n\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n▲依序使用 SAMSUNG Galaxy S20、S20+、S20 Ultra 在夜間低光環境拍攝，在預設解析度拍攝下，三者整體接近，但可透過觀察大樓外牆線條發現前兩者的塗抹感略為明顯，而 S20 Ultra 則較為銳利。（拍攝狀態：開啟 AI 與自動 HDR）\r\n超廣角測試\r\n夜間超廣角測試\r\n\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n▲依序使用 SAMSUNG Galaxy S20、S20+、S20 Ultra 在夜間使用超廣角拍攝效果，三者拍攝效果相近，但在雜訊與細節的處理上都略微不同，但都有相當程度的細節流失。（拍攝狀態：開啟 AI 與自動 HDR）\r\n夜景模式\r\n夜景模式第一組\r\n\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n▲依序使用 SAMSUNG Galaxy S20、S20+、S20 Ultra 在低光環境使用夜間模式拍攝效果，三者整體表現接近，但 S20 Ultra 對於輪廓線條的處理更為出色一些。\r\n\r\n夜景模式第二組\r\n\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n▲依序使用 SAMSUNG Galaxy S20、S20+、S20 Ultra 在低光環境使用夜間模式拍攝效果，三者整體表現接近，但 S20 Ultra 在色溫上明顯於前兩者不同。\r\n夜間人像模式拍攝\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n三星新旗艦夜拍比較 Galaxy S20系列夜間拍照實測\r\n▲依序使用 SAMSUNG Galaxy S20、S20+、S20 Ultra 在夜間以即時景深拍攝效果，在預設鏡頭拍設下，S20 Ultra 因為使用的是廣角鏡頭，而另外兩者則是使用遠距鏡頭，因此在拍攝品質上 S20 Ultra 的效果更好一些。（使用平滑肌膚 2 美化效果）\r\n評測短評\r\n在低光與夜間測試的部分，SAMSUNG Galaxy S20、S20+、S20 Ultra 三者所拍攝出的效果整體來說已經能滿足絕大部分的人的需求，但若要求極致的細節表現，三者中因 S20 Ultra 配置有更高畫素的主鏡頭再配合影像演算，能夠有更佳的表現，若非追求極致畫質表現的消費者來說，其餘兩者已足夠滿足拍攝的需求。但須注意的是夜景模式因為是透過演算法進行疊合運算，因此三者都無法在此模式下使用最高畫素拍攝。','1591170605467',1,'2020-06-03 08:13:32'),('A1591172048607','test2','高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試','三星與 OPPO 分別先後在今年推出年度旗艦手機 Galaxy S20 Ultra 與 Find X2 Pro，兩者皆採用 Qualcomm Snapdragon 865 行動平台，並主打多鏡頭與高倍變焦，其中 Galaxy S20 Ultra 最高畫素更是高達 1.08 億；雖然 Find X2 Pro 目前還未在台灣上市，但我們透過管道取得國際版工程機，特別針對這兩款高倍變焦旗艦手機進行自拍、日間與變焦的測試。\r\n\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n\r\n相機規格\r\n型號	後鏡頭組	光圈	變焦\r\nSAMSUNG Galaxy S20 Ultra	1,200 萬畫素超廣角\r\n1.08 億畫素廣角\r\n4,800 萬畫素遠距\r\nToF 景深	F2.2 光圈\r\nF1.8 光圈\r\nF3.5 光圈	10 倍混合光學變焦\r\n100 倍數位變焦\r\nOPPO Find X2 Pro	4,800 萬畫素廣角\r\n4,800 萬畫素 120 度超廣角\r\n1,300 萬畫素潛望式長焦	F1.7 光圈\r\nF2.2 光圈\r\nF2.2 光圈	10 倍混合光學變焦\r\n60 倍數位變焦\r\n自拍\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n▲依序使用 SAMSUNG Galaxy S20 Ultra 與 OPPO Find X2 Pro 前鏡頭人像模式拍攝效果，兩者美化效果不同，但 Galaxy S20 Ultra 使用人像模式時背景仍能利用 HDR 保留較多細節。（Galaxy S20 Ultra 使用柔焦 4、平滑肌膚 4 美化效果、Find X2 Pro 使用 AI 美顏）\r\n日間拍照\r\n拍攝設定\r\n\r\n型號	相機測試模式	預設畫素\r\nSAMSUNG Galaxy S20 Ultra	AI 場景開啟、HDR 自動	預設 1,200 萬（最高1 億 800 萬畫素 ）\r\nOPPO Find X2 Pro	AI 色彩開啟、HDR 自動	預設 1,200 萬（最高 4,800 萬畫素）\r\n\r\n日間第一組\r\n\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n▲依序使用 SAMSUNG Galaxy S20 Ultra 與 OPPO Find X2 Pro 日間拍攝效果，兩者細節表現接近，但 Galaxy S20 Ultra 畫面的色彩與對比較為強烈，Find X2 Pro 整體亮度則是又略高一些。\r\n\r\n日間第二組\r\n\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n▲依序使用 SAMSUNG Galaxy S20 Ultra 與 OPPO Find X2 Pro 日間陰影處拍攝效果，兩者細節表現接近，但 Galaxy S20 Ultra 畫面的白平衡與色彩相對討喜一些。\r\n\r\n日間第三組\r\n\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n▲依序使用 SAMSUNG Galaxy S20 Ultra 與 OPPO Find X2 Pro 日間拍攝效果，兩者細節表現接近，但 Find X2 Pro 整體亮度略高一些。\r\n超廣角測試\r\n超廣角第一組\r\n\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n▲依序使用 SAMSUNG Galaxy S20 Ultra 與 OPPO Find X2 Pro 日間超廣角拍攝效果，兩者細節表現接近，但 Galaxy S20 Ultra 的廣角涵蓋範圍更廣，但在自動偵測的情況下拍攝出來的畫面則偏暗，Find X2 Pro 整體畫面亮度較高一些。\r\n\r\n超廣角第二組\r\n\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n▲依序使用 SAMSUNG Galaxy S20 Ultra 與 OPPO Find X2 Pro 日間拍攝效果，兩者細節表現接近，但可看出 Galaxy S20 Ultra 邊緣畫質的衰減較輕微。\r\n\r\n1 倍變焦\r\n\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n▲依序使用 SAMSUNG Galaxy S20 Ultra 與 OPPO Find X2 Pro 的 1 倍拍攝效果，兩者在 1 倍狀態下都會使用主鏡頭。\r\n\r\n2 倍變焦\r\n\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n▲依序使用 SAMSUNG Galaxy S20 Ultra 與 OPPO Find X2 Pro 的 2 倍拍攝效果，在 2 倍變焦的情況下，兩者都是使用數位變焦的方式。\r\n\r\n5 倍變焦\r\n\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n▲依序使用 SAMSUNG Galaxy S20 Ultra 與 OPPO Find X2 Pro 5 倍變焦拍攝效果，Galaxy S20 Ultra 則是會使用遠距鏡頭搭配混合變焦拍攝，而 Find X2 Pro 則是會利用 5 倍光學鏡頭拍攝，在此焦段 Find X2 Pro 的細節表現較佳。\r\n\r\n10 倍變焦\r\n\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n▲依序使用 SAMSUNG Galaxy S20 Ultra 與 OPPO Find X2 Pro 的 10 倍拍攝效果，此時兩者皆使用長焦鏡頭搭配混合變焦拍攝，可發現 Galaxy S20 Ultra 所拍攝的細節較為清晰。\r\n\r\n30 倍變焦\r\n\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n▲依序使用 SAMSUNG Galaxy S20 Ultra 與 OPPO Find X2 Pro 的 30 倍拍攝效果，此時兩者皆使用遠距鏡頭搭配混合變焦拍攝，可發現 Galaxy S20 Ultra 所拍攝的 101 頂端細節較為清晰。\r\n\r\n60 倍變焦\r\n\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n▲依序使用 SAMSUNG Galaxy S20 Ultra 與 OPPO Find X2 Pro 的 60 倍拍攝效果，可發現 Galaxy S20 Ultra 所拍攝的 101 頂端細節仍較為清晰。\r\n\r\n100 倍變焦\r\n\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n▲使用 SAMSUNG Galaxy S20 Ultra 的 100 倍拍攝效果。\r\n日間人像模式拍攝\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n高變焦旗艦拍照比較！三星S20 Ultra與OPPO Find X2 Pro日間測試\r\n▲依序使用 SAMSUNG Galaxy S20 Ultra 與 OPPO Find X2 Pro 人像模式拍攝效果，兩者美化效果不同，而 Galaxy S20 Ultra 能針對更細微的髮絲與背景做更好的分離效果。（Galaxy S20 Ultra 使用柔焦 4、平滑肌膚 4 美化效果、Find X2 Pro 使用 AI 美顏）\r\n評測短評\r\n在日間測試的部分，SAMSUNG Galaxy S20 Ultra 與 OPPO Find X2 Pro 除了因測光與 AI 調整所造成的差異，整體拍攝出的品質都相當接近，但在變焦拍攝的情況下，Galaxy S20 Ultra 除了具有最高 100 倍的混合變焦，在高倍變焦的焦段細節表現上略勝一籌。\r\n\r\n不過，由於此次測試的 OPPO Find X2 Pro 並非市售版本，屬於工程版的測試樣機，在軟體上或許還有進步的空間，因此僅供參考，未來待產品正式上市後，我們也將進一步測試。','1591170817533',1,'2020-06-03 08:14:09');
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
INSERT INTO `member` VALUES ('test','Test','male','test road','0912345678','test','test@test'),('test2','Test2','female','testroad','0987654321','test2','test2@test2');
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
INSERT INTO `product` VALUES ('1590583489159','Sony Xperia 10 II','Sony Xperia 10 II',10700,'Sony Mobile','Android 10','img\\xperia10II.jpg','6\"','128GB'),('1590583733034','Apple iPhone SE (2020)','A2296',13400,'Apple','iOS 13','img\\Apple iPhone SE (2020).jpg','4.7\"','64GB'),('1591170605467','SAMSUNG Galaxy S20','SM-G981',23600,'Samsung Electronics','Android 10','img\\SAMSUNG_Galaxy_S20_5G.jpg','6.2\"','128G'),('1591170817533','SAMSUNG Galaxy S20 Ultra','SM-G988',32700,'Samsung Electronics','Android 10','img\\SAMSUNG_Galaxy_S20_Ultra.jpg','6.9\"','256G'),('1591171256596','Apple iPhone 11 128GB','iPhone 11',23590,'Apple','iOS 13','img\\iPhone11.jpg','6.1\"','128G'),('1591171426029','Sony Xperia 1','J8110',21200,'Sony Mobile','Android 9.0','img\\xperia1.jpg','6.5\"','128G');
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

-- Dump completed on 2020-06-04 12:36:19
