CREATE DATABASE  IF NOT EXISTS `myproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `myproject`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: myproject
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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `articleId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `articleTitle` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `articleContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `articleUploadTime` datetime NOT NULL,
  `articleProductId` int(11) NOT NULL,
  `articleAuthorId` int(11) NOT NULL,
  `audited` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`articleId`),
  UNIQUE KEY `articleId_UNIQUE` (`articleId`),
  KEY `a_idx` (`articleAuthorId`),
  KEY `b_idx` (`articleProductId`),
  CONSTRAINT `a` FOREIGN KEY (`articleAuthorId`) REFERENCES `user` (`id`),
  CONSTRAINT `b` FOREIGN KEY (`articleProductId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (120,'旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !','一周前才分享日本有一批牛肉很便宜(Xperia 1)，想不到反應熱烈，短時間訂單過多，導致日本店家警急關閉海外配送服務，經過再次協商終於又開放訂購服務，上次沒有上車的朋友，這次手腳可要快一點。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n推薦理由 :\r\n#售價較台灣販售價格便宜近萬元。\r\n#SIM解鎖服務已完成，省去額外花費。\r\n#可直接使用台灣SIM卡使用。\r\n#介面多國語言供切換\r\n#日本旅遊，手機可以觀看當地數位電視。\r\n\r\n不推薦理由:\r\n#內建僅有64GB ROM\r\n#單卡\r\n#沒有提供台灣保固，只能日本送修。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n參考我的訂單，此價格已包含海外配送，其中內含進口關稅費用，簡單來說只要支付日幣43064元(約台幣11973元)，就可將大師級手機 Xperia 1帶回家。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n訂購時推薦選擇海外優先配送(JP¥1,232)，將可以大幅縮短到貨時間，如果不小心選擇了海外標準配送，可在原訂單上進行修改，不需要特別取消訂單修改。我的訂單是在5月9日產生，實際收到貨是5月15日，算起來速度還蠻快的。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n配送商是透過DHL進行運送，隨時都可以查詢配送進度。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n日版外盒較台灣版來的小，而且是軟紙盒材質。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n背面\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n內容物:手機、USB-C 轉3.5耳機 (兼具數位天線接收功能)\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n熱騰騰的開箱\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\nSoftbank Xperia 1 硬體規格特色: Snapdragon 855處理器、21:9 6.5 吋 4K OLED HDR 螢幕、6GB RAM、64GB ROM (支援microSD擴充)、主鏡頭12MP+12MP+12MP、前相機8MP、IP65 / IP68 防水防塵等級、PD 3.0 快充。\r\n\r\n保護膜上有相關備註事項:\r\n#避免通話時進行充電，會造成手機溫度上升，容易肌膚燙傷等情況。\r\n#雖說機身前後均採用康寧玻璃材質，但如摔落破裂時可能會割傷手。\r\n#強制重開機的方式:電源鍵+音量加同時按住。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n背面保護膜備註事項:\r\n安裝SIM/SD卡方式，確保蓋子密合才能提供防水機能。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n配件部分:說明書、USB-C 轉3.5耳機 (兼具數位天線接收功能)。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n外觀部分與台版幾乎是相同\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n背面也是一樣\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n不過日版僅有提供單卡服務，不像台版是雙卡服務。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n採用三鏡頭配置，皆為 1200 萬畫素，使用了16mm 超廣角鏡頭、26mm 標準鏡頭、52mm 望遠鏡頭。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n除了有些日本才有提供的App還是維持日文字體，不然基本上已經為繁體中文化。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n像是Xperia 1 主打的遊戲增強器、Dolby Atmos 杜比全景聲音效、Cinema Pro 電影級專業錄影這些功能都有提供，反正就跟台版幾乎相同。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n輸入法還保有Xperia 中文鍵盤，可惜在Xperia 5後機種僅提供Google輸入法。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n另外日版內儲空間僅有64GB，扣完系統和內建應用程式後，實際可用空間為40GB左右。\r\n但我覺得是可以使用MicroSD進行擴充，尤其是拍照儲存的目錄要改成記憶卡，這樣空間才不會逼太緊。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n另外安裝台灣電信商的SIM卡後，在設定>網路和網際網路>行動網路>進階>存取點名稱(APN)需要手動輸入。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n名稱輸入: Internet  APN:Internet，或是針對你使用的電信商所提供資訊輸入即可，並按下儲存即可，這樣就可以使用行動數據服務。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n開箱先到這邊，接下來會在內文中分享與台版差異處。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n目前看到的部分，日版可以提供變更字體及圖示形狀。\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n當各位收到時，系統是預載android 9.0，你可下載Xperia Companion依序進行更新升級，詳細版本及更新內容，請參考softbank.jp官網，android 10版本為55.1.B.0.167，這版本將會提供更快的人眼追蹤對焦及升級版的Cinema Pro。Sony Xperia 1 與 Xperia 5 台灣 正式推送 Android 10 軟體升級服務\r\n\r\n旗艦機 平民價 台幣1萬2入手 ! 日版Softbank Xperia 1 夜空黑 開箱 !\r\n\r\n\r\n或是參考束褲3C的影片介紹\r\n \r\n\r\n\r\n\r\n\r\n工商服務 :  Xperia 1 保護貼、手機殼購買 請參考\r\nRASTA BANANA 香蕉牌 日本銷售 NO.1 SONY XPERIA 1 滿版保護貼、手機殼 開箱 !\r\n日本 RASTA BANANA 香蕉牌 Sony Xperia 1 手帳型、指環型 手機保護套 開箱 分享 !\r\n續…','2020-05-20 08:06:36',19,25,1),(121,'日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享','Sony 今年上半年首推的新機：Xperia 10 II 以 IP65/68 防水防塵的能力以及三獨立鏡頭的優勢降臨台灣萬元手機的市場，在目前疫情艱困的台灣手機市場，添加新的生力軍，也讓消費者能夠在為數不多的智慧型手機當中，多一款產品可以挑選。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n\r\n而這次 Sony Xperia 10 II 也承襲了過去 Sony Xperia 系列智慧型手機該有的 DNA，有著不少日系手機該有的特色，像是 Sony 近期主打來自 Bravia 的螢幕調校技術，透過 21:9 的螢幕比例打造沉浸式的視覺體驗、支援 Hi-Res 的高音質音效以及音樂的 360 Reality Audio 技術，都是重視聲光娛樂效果的 Sony 應該打造的產品。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n\r\n今天就讓我們來帶大家看一下，這款 Xperia 10 II 的評測內容，看看這是不是在近期處在手機沙漠的你，想要購買的手機吧！\r\n\r\n \r\nXperia 10 II 外觀開箱介紹：\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n​▲ 台灣市售版的 Xperia 10 II 與先前的 Xperia 手機一樣，採用白色的紙盒包裝，當然公司貨當中會有台灣 Sony Mobile 的資訊卡。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n​▲ 在配件的部分也很簡單提供了耳機、充電器以及充電線，並沒有附上保護殼。不過消費者們如果在 6 月 30 日前選購的話，則是會加碼贈送首購禮，裡面就會有 Xperia 10 II 專用的保護殼哦～\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n​▲ 另外充電器並不是快充的配置，不過 Sony 這次有強調，Xperia 10 II 內建智慧充電的設計，透過 5V/1500mA 的充電器也能使用 AI Charge 功能，除了智慧充電功能之外同時能保護電池壽命。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n​▲ 另外在手機外觀的部分來看，這次 Xperia 10 II 採用的是玻璃背蓋的設計，過去不少日系手機都很愛採用玻璃背蓋，這次 Xperia 10 II 也同時回歸這樣的設計，相信日系手機死忠的粉絲們應該相當愛不釋手。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n​▲ 同時這次也讓指紋辨識整合電源按鍵的設計回歸了，讓人覺得這樣才是 Sony 手機啊～\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n​▲ 獨立三鏡頭的部分從 16mm~52mm 都能夠進行縮放變焦，在拍照功能的部分，我們放到後面相機功能再來談。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n​▲ 另外本次同樣採用 21:9 的螢幕比例之外，螢幕材質也同時升級為 OLED 螢幕，讓 Xperia 10 II 雖然只是中階機，但是不少部分都升級為旗艦級手機的水準。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n​▲ 機身頂端保留了一點額頭的設計，保有正常的螢幕比例才是 Sony 一貫的作風。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n​▲ SIM 卡槽的部分則是採用三選二 Combo 的設計，SIM2 卡槽可以選擇安裝第二張 SIM 卡或是 microSDXC 記憶卡。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n​▲ 底部的充電設計則是採用 USB-C 介面。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n​▲ 同時喇叭的部分則是隱藏在螢幕最下方的細孔條當中。\r\n\r\n \r\n第三代 AI 核心處理器 提供效能與智慧的結合\r\nXperia 10 II 採用的是高通 Snapdragon 665 處理器，屬於六系列第三代 AI 智慧引擎核心，採八核心  11 奈米製程、最高 2.0Ghz 時脈的一款處理器。雖然沒有讓手機搭載能夠支援 5G 連線的處理晶片，但是如果使用更高檔的處理器的話，很有可能會讓手機成本變高，要讓價格在萬元初販售可能不太可能。而  Snapdragon 665 在一般日常生活以及遊戲上也能有高於水準的表現了，在跑跑網頁或是下載遊戲遊玩等都不算是會太吃力。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享 日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n​▲ 在處理器跑分分數上，透過最新的 Geekbench 5 上所得到的分數為單核 312 分、多核 1416  分。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n​▲ 出廠即搭載 Android 10 作業系統。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n​▲ 外觀的設計上也都是最新版本的介面設定。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n​▲ 先前舊有的側面快速功能鍵目前則是以長條棒狀的形式在螢幕邊緣，只要輕觸一下就能夠出現側面感應功能鍵。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n​▲ 另外 21:9 因為螢幕夠長，所以分割畫面多視窗 App 也能夠繼續使用。\r\n\r\n \r\n獨立三鏡頭拍照，讓你遠近都好拍\r\n在拍照的部分，Sony Xperia 10 II  支援獨立的三鏡頭功能，分別為超廣角 16mm、標準 26mm 以及  52mm 三個焦段，在焦段的應用部分與先前的旗艦 Xperia  1 與 Xperia 5 相同，同時這次藉由 AI 處理器的功力，新增了獨立的夜景模式功能，讓過去在中階機部分一直郖是夜拍弱項的 Sony 機，這次能藉由夜拍模式扳回一城。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n▲ 在手機啟動夜景模式，即可進入夜景模式拍照。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n​▲ 拍照後使用者也只需拿穩相機（也不用說特別穩，一般呼吸的微動是沒問題的），相機會自動取景以及透過 AI 的方式修補畫面，與一般他廠手機的夜景模式使用起來一樣。\r\n \r\n​▲ 左：啟動夜景模式；右：一般模式\r\n \r\n​▲ 左：啟動夜景模式；右：一般模式\r\n\r\n\r\n另外在焦段的調整上，這次 Xperia 10 II 終於能夠在超廣角的部分微調縮放畫面了，過去在 Xperia 1  上的 0.6x 超廣角只能獨立選擇拍攝，無法在 0.6x~1x 之間做縮放，但是這次 Xperia 10 II  終於突破了這個限制，相信接下來的 Xperia 1 II 應該也會比照辦理。\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n▲ 終於能夠在廣角～標準之間進行縮放了。\r\n\r\n更多 Xperia 10 II 實拍照片分享：\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n\r\n \r\n小結：旗艦級防水、三鏡頭以及日系手機的元素\r\n這次 Xperia 10 II 的推出，應該打動了不少過去日系手機迷的心，在外型上從上一款 Xperia 10 開始，機身外型就已經回來了，而這次更是把玻璃機背以及指紋整合電源鍵的功能整合回來，而這樣美型的外觀設計，正是過去日系手機迷想要的手機。再者，這次的 Xperia 10 II 搭載了 21:9 OLED 螢幕以及支援 IP65/68 防水防塵的能力，這些過去旗艦機才有的規格，這次都硬生生的下放到了 Xperia 10 II 身上，只能說我們有好一陣子沒有在 Sony 的中階機種上看到如此有料的配置，即是我們上一季說過，但這一季再說一次也無妨的一句話就是：「Sony  真的回來了」！\r\n\r\n日系美型機回歸：擁有防水三鏡頭的 Xperia 10 II 評測分享\r\n\r\n畢竟目前疫情嚴峻，許多廠的手機都受到延遲或是因為種種緣故無法上市，使得市面上能挑選的 2020 新機可以說是少之又少，但是至少目前為止有了 Xperia 10 II  的加入，讓台灣智慧型手機市場又有那麼一點可看性。此外這次 Xperia 10 II 的開價並不貴，以台幣 11,490 的價格推出，相信都在一般消費者可以接受的手機產品價格代當中，同時又是日系美型機，想必應該可以吸引不少正準備換機的消費者購買吧！','2020-05-20 10:21:05',20,25,1);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `featured` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'One Plus 6','12000','One Plus','yes','img/oneplus-6.jpg'),(2,'iPhoneX (256 G)','41500','Apple','yes','img/iphone-x.jpeg'),(3,'Pocophone F1','10999','Xiaomi','yes','img/pocophone-f1.jpg'),(4,'Samsung S9','25500','Samsung','yes','img/samsung-s9.jpg'),(19,'Xperia 10 II','30000','Sony','yes','img/xperia10.jpg'),(20,'Xperia 1','12000','Sony','yes','img/xperia1.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (25,'test','test','test@test','test','testtest');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-23 19:29:31
