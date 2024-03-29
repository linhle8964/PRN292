USE [master]
GO
/****** Object:  Database [PRN292_Assignment]    Script Date: 7/26/2019 12:23:25 AM ******/
CREATE DATABASE [PRN292_Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRN292_Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PRN292_Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRN292_Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PRN292_Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PRN292_Assignment] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRN292_Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRN292_Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRN292_Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRN292_Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRN292_Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRN292_Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET RECOVERY FULL 
GO
ALTER DATABASE [PRN292_Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [PRN292_Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRN292_Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRN292_Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRN292_Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRN292_Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRN292_Assignment] SET QUERY_STORE = OFF
GO
USE [PRN292_Assignment]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PRN292_Assignment]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 7/26/2019 12:23:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Summary] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Category]    Script Date: 7/26/2019 12:23:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Category](
	[BookID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookRequest]    Script Date: 7/26/2019 12:23:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookRequest](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/26/2019 12:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 7/26/2019 12:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapter](
	[ChapterID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ChapterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/26/2019 12:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[BookID] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/26/2019 12:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Phone] [int] NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Avatar] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoteScore]    Script Date: 7/26/2019 12:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoteScore](
	[VoteID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[BookID] [int] NOT NULL,
	[Score] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookID], [Title], [Summary], [Author], [Image]) VALUES (1, N'A Dance with Dragons', N'A Dance with Dragons is the fifth novel, of seven planned, in the epic fantasy series A Song of Ice and Fire by American author George R. R. Martin. In some areas, the paperback edition was published in two parts, titled Dreams and Dust and After the Feast. It was the first novel in the series to be published following the commencement of the HBO series adaptation, Game of Thrones, and runs to 1,040 pages with a word count of almost 415,000.', N'George R. R. Martin.', NULL)
INSERT [dbo].[Book] ([BookID], [Title], [Summary], [Author], [Image]) VALUES (2, N'A Feast for Crows', N'A Feast for Crows is the fourth of seven planned novels in the epic fantasy series A Song of Ice and Fire by American author George R. R. Martin. The novel was first published on October 17, 2005, in the United Kingdom,[1] with a United States edition following on November 8, 2005', N'George R.R. Martin', NULL)
INSERT [dbo].[Book] ([BookID], [Title], [Summary], [Author], [Image]) VALUES (4, N'Harry Potter', N'Arkham city is a bustling hub of commerce and industry, however Arkham is also a center of eldrich lore: home to Miskatonic University, an institution of higher learning with one of the most complete libraries of arcane literature in the world. In the span of two generations the town was built up to the status of prestige it now commands, an expansion helmed by the Hadou Group, an industrial complex and family dynasty currently run by the young Hadou Ruri. She pursues the peace and prosperity of Arkham diligently, against the forces of darkness threatening to plunge the city, and the world, back into a second dark age. Among the most sinister threats to Arkham City is the evil Black Lodge syndicate.', N'J.K.Rowling', NULL)
INSERT [dbo].[Book] ([BookID], [Title], [Summary], [Author], [Image]) VALUES (5, N'Tokyo Game', N'In post-apocalyptic Japan, a nameless mahjong player ascends a massive tower, facing formidable opponents in life or death gambles.', N'Hiromi Aoyama', NULL)
INSERT [dbo].[Book] ([BookID], [Title], [Summary], [Author], [Image]) VALUES (6, N'Classroom Elite', N'Shogo Kinugasa', N'Shogo Kinugasa', NULL)
INSERT [dbo].[Book] ([BookID], [Title], [Summary], [Author], [Image]) VALUES (7, N'Sword Art Online', N'He quickly befriends the guards, Frank Zhang, son of Mars; and Hazel Levesque, daughter of Pluto, and subsequently gets introduced to the praetor of the camp, Reyna, and the augur Octavian, who quickly takes a dislike to Percy. Octavian tells Percy that the Book of Prophecies is missing. Being outcasts themselves at Camp Jupiter, Frank and Hazel empathize with Percy''s outsider status and consider it their duty to help him adjust and acclimatize quickly to the camp''s routines and leadership. But before any of them has a chance to gain their footing, they are ordered to go on a quest to rescue Thanatos, the god of death, from the Giant Alcyoneus who is hiding deep in Alaska after receiving a direct prophecy from Mars, the Roman god of war: ', N'Shogo Kinugasa', NULL)
INSERT [dbo].[Book] ([BookID], [Title], [Summary], [Author], [Image]) VALUES (8, N'The Son of Neptune', N'He quickly befriends the guards, Frank Zhang, son of Mars; and Hazel Levesque, daughter of Pluto, and subsequently gets introduced to the praetor of the camp, Reyna, and the augur Octavian, who quickly takes a dislike to Percy. Octavian tells Percy that the Book of Prophecies is missing. Being outcasts themselves at Camp Jupiter, Frank and Hazel empathize with Percy''s outsider status and consider it their duty to help him adjust and acclimatize quickly to the camp''s routines and leadership. But before any of them has a chance to gain their footing, they are ordered to go on a quest to rescue Thanatos, the god of death, from the Giant Alcyoneus who is hiding deep in Alaska after receiving a direct prophecy from Mars, the Roman god of war: ', N'Rick Rordan', NULL)
INSERT [dbo].[Book] ([BookID], [Title], [Summary], [Author], [Image]) VALUES (9, N'The Lost Hero', N'Jason Grace awakens on a school bus, unable to remember anything about his past. He is placed next to Piper McLean, his apparent girlfriend and Leo Valdez, his apparent best friend. All three are part of a class field trip to the Grand Canyon, and after they arrive, a classmate, Dylan, turns into a storm spirit and attacks the trio and their trip leader, Coach Gleeson Hedge. In the ensuing fight, Jason battles the spirit and surprises everyone with his powers; Hedge is revealed to be a satyr and is captured by the storm spirit as it flees. A flying chariot with two demigods appear on the scene. The female demigod, Annabeth Chase, expresses her frustration upon seeing that her missing boyfriend, Percy Jackson, is not there as she expected. Jason, Piper, and Leo are told that they are Greek demigods and are taken back to Camp Half-Blood. There, Leo is revealed as a son of Hephaestus, Piper as a daughter of Aphrodite and Jason as a son of Zeus, though Hera tells him he is her champion. ', N'Rick Rordan', NULL)
INSERT [dbo].[Book] ([BookID], [Title], [Summary], [Author], [Image]) VALUES (10, N'The Mark of Athena', N'Leo, who has the rare ability to conjure fire, does not use nor tell anyone about it out of guilt about his mother''s death seven years prior. Meanwhile, Jason finds out about his sister Thalia Grace, a daughter of Zeus and lieutenant of the Hunters of Artemis. In the woods, Leo discovers a damaged mechanical bronze dragon and rejuvenates it. Shortly thereafter, the three are given a quest to rescue Hera from danger. After encountering Boreas, Piper, Jason, and Leo soon discover that their enemies are working under orders from Gaea, the Greek primordial goddess of the Earth, to overthrow the gods. Throughout their journey, they overcome numerous obstacles and eventually manage to save Coach Hedge. During their quest, they meet Thalia and the Hunters, who have also been looking for Percy. Thalia and Jason have a reunion, the first since Jason was two, but soon get separated on the way to Aelous''s castle. After almost being imprisoned by Aeolus under Gaea''s orders, the trio manage to escape and end up in San Francisco. ', N'Rick Rordan', NULL)
SET IDENTITY_INSERT [dbo].[Book] OFF
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (1, 1)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (1, 2)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (1, 3)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (2, 1)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (2, 5)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (2, 6)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (4, 2)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (4, 7)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (4, 9)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (5, 3)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (5, 5)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (6, 2)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (6, 4)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (7, 1)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (7, 3)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (7, 6)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (8, 2)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (8, 9)
INSERT [dbo].[Book_Category] ([BookID], [CategoryID]) VALUES (8, 10)
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Romance')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Yuri')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Action')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Shonen')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Slice of life')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'Tragedy')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (7, N'Adventure')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (8, N'Isekai')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (9, N'Harem')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (10, N'Shoujo')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Chapter] ON 

INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (1, 1, N'Chapter 1: Catelyn', N'Prologue in Oldtown
Pate, a young apprentice at the Citadel in Oldtown, is studying to become a maester. He has stolen an important key to a depository of books and records at the request of a stranger in exchange for a reward; after turning over the key and receiving the reward, he dies abruptly from poison.

King''s Landing
Following the death and funeral of Tywin Lannister, Cersei''s reign is marked by rampant cronyism, and her councils staffed with incompetent loyalists. She also disregards accurate advice by her uncle Kevan Lannister and her brother Jaime, alienating them both. Making matters worse is Cersei''s increasing distrust of the Tyrells, particularly Margaery, whom Cersei implicates in a prophecy that Cersei herself will see her children crowned but all of them will die before her.

Her incompetent management raises the kingdom''s debts to the Iron Bank of Braavos and the Faith of the Seven. When Cersei dismisses its representatives, the Iron Bank refuses to grant new loans and demands immediate repayment, nearly crippling the economy of Westeros. To settle the crown''s debts to the Faith of the Seven, Cersei permits the restoration of that religion''s military order, the Faith Militant, ignoring the danger to her own power. Hoping to weaken the Tyrells, Cersei dispatches Ser Loras Tyrell to besiege Stannis Baratheon''s forces on Dragonstone; as a result, almost a thousand loyalists are killed, and Ser Loras is gravely injured. A scheme to falsely have the Faith put Margaery on trial for adultery backfires when the religious leadership imprisons Cersei herself on similar (correct) charges.

Riverlands
After a series of disagreements, Cersei dispatches Jaime to the Riverlands to re-establish control. He negotiates with Brynden "the Blackfish" Tully to surrender Riverrun in exchange for Edmure Tully''s life, Riverrun having been granted to Walder Frey''s second son Emmon, who is married to Tywin''s sister Genna Lannister. Though the siege ends bloodlessly, Brynden escapes, to Jaime''s fury. Jaime also finds that Walder Frey''s grandson and heir, Ryman Frey, was hanged by the Brotherhood without Banners. He then receives word that Cersei, who has been imprisoned, wants him to defend her in a trial by combat; but learns that Tyrion''s accusation of Lancel Lannister and Cersei was true (Lancel having been King Robert''s true killer). Disgusted by the excessive loss of life and Cersei''s paranoia, Jaime abandons her to her fate.

Brienne of Tarth''s quest for Sansa leads her all over the Riverlands, where she observes the destruction caused by the war, and acquires Podrick Payne, former squire to Tyrion Lannister. She meets Ser Hyle, a knight whom she has met before, and Lord Randyll Tarly (Samwell''s father), who insults her despite Ser Hyle''s praise of her. Eventually she is captured by the Brotherhood Without Banners and sentenced to death by Catelyn Stark, who was resurrected three days after death by Beric Dondarrion, though at the cost of Dondarrion''s life, and who has now assumed the name Lady Stoneheart. Catelyn offers to let her live if she agrees to kill Jaime Lannister (whom she believes played a role in Robb''s death). When Brienne refuses to decide, she and some of her companions are sentenced to be hanged, at which she screams an undisclosed word. The author later revealed that the word was "sword", in response to Catelyn''s ultimatum of "Sword or noose", which offered either Brienne''s continued service to Catelyn herself, or hanging.

The Vale
In the Eyrie, Sansa poses as Petyr''s daughter Alayne, befriending young Robert Arryn, managing the household, and receiving informal training in royal politics. During this time, Petyr appears to be carefully manipulating his murdered wife''s former bannermen and securing control of the Protectorship of the Vale. He eventually reveals that he has betrothed Sansa to Harrold Hardyng, the next in line to Robert''s title; when the sickly Robert dies, Petyr intends to reveal Sansa''s identity and claim her family stronghold of Winterfell in her name.

Iron Islands
On the Iron Islands, Aeron Damphair hears of Balon''s death and that Balon''s eldest surviving brother, Euron Greyjoy, has returned from exile and claimed the Seastone Chair. To prevent this Aeron calls a Kingsmoot to identify Balon Greyjoy''s successor as king of the Iron Islands. Hotly contested by Balon''s brother Victarion Greyjoy and daughter Asha Greyjoy, eventually Euron is chosen as king for his promise to control dragons with an enchanted horn he possesses. The fleet of the Iron Men captures the Shield Islands at the mouth of the river Mander, threatening House Tyrell''s seat at Highgarden. Victarion estimates that when the Redwyne fleet returns from the siege at Dragonstone it will retake the islands; and when Euron sends him east to woo Daenerys Targaryen on his behalf, to thus gain a claim to the Iron Throne, Victarion decides to woo her for himself instead.

Dorne
In Dorne, Doran Martell is confronted by three of his brother Oberyn''s bastard daughters, who want vengeance for their father''s death. Because they are inciting the commonfolk, Doran has them imprisoned in the palace.

A bold attempt by Doran''s daughter Arianne Martell and her lover, Ser Arys Oakheart of the Kingsguard, to crown Doran''s ward Myrcella Baratheon as queen of Westeros under Dornish law ? by which the eldest child succeeds regardless of gender ? is thwarted by Doran. In the confusion, one of Arianne''s co-conspirators, the knight Gerold "Darkstar" Dayne, attempts to kill Myrcella; she survives but her face is scarred, and Ser Arys is killed. This strains the new Dornish alliance with House Lannister and the Iron Throne. To his daughter, Doran reveals that her brother Quentyn has gone east to bring back "Fire and Blood".')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (2, 1, N'Chapter 2: Robb', N'Across the Narrow Sea
Arriving in Braavos, Arya Stark finds her way to the House of Black and White, a temple associated with the assassins known as the Faceless Men. As a novice there, Arya attempts to master their belief that Faceless Men have no true identity by throwing all her treasures into the water (secretly keeping her sword, Needle) and posing as a girl called "Cat of the Canals". Her former identity asserts itself in the form of wolf dreams, and also when she kills Dareon, sworn brother of Samwell Tarly, for abandoning the Night''s Watch. Having confessed this death, she is given a glass of warm milk as punishment. She wakes up the following morning blind.

Jon Snow has ordered Samwell Tarly to sail to the Citadel in Oldtown (via Braavos), to research the Others and become a Maester. Sam is accompanied by aging Maester Aemon, the wildling mother Gilly, her newborn baby, and sworn brother Dareon. The voyage across the Narrow Sea is underway before Sam realizes Jon swapped the sons of Gilly and Mance Rayder, to protect the Wildling "prince" from sacrifice by the priestess Melisandre. Aemon becomes sick and the party waits in Braavos for his health to improve. After a Summer Islander tells Aemon about the Targaryen dragons, Aemon decides that Daenerys has come to fulfill a prophecy. He dies at the age of 102 shortly after they leave Braavos.

At the end of the novel, Samwell arrives at the Citadel to begin his training. He meets the archmaester Marwyn, who tells him the Citadel have a plan against magic, and leaves to find Daenerys. Samwell also encounters a fellow apprentice who introduces himself as Pate, connecting the prologue to the narrative.')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (4, 5, N'Chapter 1', N'It felt like I was finally getting used to my daily life here.

Without noticing, almost a full year had passed since I started living in the dorms.

“It feels like time doesn’t pass by like it used to.”

The passage of time would feel different depending on how much you were enjoying yourself.

Honestly, when I first learned about this phenomenon, I didn’t understand the meaning very well.

Before I started high school, every second of my life had felt exactly the same. But now, it was different.

Obviously, the days were still passing by at the same speed as always. There were still two years left until graduation.

But it was strange. The more I thought about it, the more I felt like graduation day would come along in the blink of an eye.

“Morning Ayanok?ji-kun~!”

I heard Ichinose call out from behind me as soon as I stepped outside. It was probably because we both left for school at roughly the same time every morning. I looked behind me and responded to her.

“Ah. Good morning Ichinose.”

Strangely enough, as soon as I called out to her, Ichinose stiffened up for some reason.

“Hmm?”

5J0wKTh


REPORT THIS AD

She was standing perfectly still, frozen with her hand in the air. 

“What’s wrong?”

My question seemed to snap her out of the trance she was in as she proceeded to walk over. Although, her movements were still a bit stiff in some respects. 

“Wow, uhh… it’s pretty cold again today, huh?”

“I suppose so.”

Our breath was visible in the air as we spoke.

“Did you plan on walking to school with someone?”

“Not at all. I’m usually by myself in the mornings.”

“Well then… do you mind if I join you?”

There probably wasn’t a single student out there capable of turning her down when she asked like this.

I responded with a nod.

“…”

“……”

Whenever the two of us had ended up alone together in the past, Ichinose would usually be the one to start the conversation. This time, however, the only sound breaking the silence between us was the sound of our footsteps as Ichinose walked a short distance behind me.

So, I decided to try asking her about the exam.

“This next special exam must be a pretty difficult thing for you and your class, huh?”

In comparison to the other classes, Class B had overwhelmingly solid teamwork and a strong overall sense of camaraderie.

Being forced to decide on which student to remove would probably be heart-wrenchingly painful for all of them.


REPORT THIS AD

“Ah, well… Yeah, I think this exam is the toughest we’ve had by far.

“Probably.”

I could tell as much based on her clouded expression alone.

Ichinose, as the leader of her class, was the only one who was absolutely safe.

Compared to Hirata or Kushida, she was in a completely different situation altogether. She seemed like the only student effectively guaranteed to make it through the exam.

And this was why having to cut someone from the class was such a painful decision for her.

She may as well stick to the sidelines and not get involved with the vote at all. It would probably be less stressful for her that way.

It might’ve been possible for Ichinose to do something like that, but…

“In the face of such a terrible exam… I really have no choice but to do something, don’t I?”

“Well, that’s probably true.”

“…Yeah. I must do something.”

She walked up beside me as she said this.

From the side, I could see a thin smile on her face.

“Are you… thinking of dropping out yourself, Ichinose?”

“Eh? No way. I definitely didn’t say anything like that.”

She denied it, but the look in her eyes gave another impression.

That she was fully prepared to make that choice if she needed to.

“Just for the record, your classmates wouldn’t be willing to vote for you very easily.”

“I told you that I never said anything about dropping out myself. But, if you really think so then I guess you’re probably right about that.”

“The fact that you’ve been considering it is written all over your face.”


REPORT THIS AD

“R-really?”

Ichinose hurriedly tried to confirm it.

Was this natural or was she doing it on purpose?

It seemed to be the former this time.

“Haa… Keep it a secret from everyone okay?”

“Are you really willing to sacrifice yourself for someone else’s sake?”')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (5, 5, N'Chapter 2', N'The sports festival ended in mid-October, around the time of year when it started getting chilly.

The school held a general election to decide who would be in charge of the next student council. Immediately after the election concluded, the school ushered in the handover ceremony of the student council. It was a large-scale event that gathered students from the entire school to the gymnasium. However, for most of the first year students, it was a very uneventful experience. They were drowsy, but they were attempting to keep quiet and slow their breathing so the teachers and upperclassmen wouldn’t notice them.

“Now, here are some final remarks from president Horikita of the student council.”

Following the moderator’s speech, Horikita Manabu slowly approached the microphone on the stage.

If it was the Horikita from before, the younger one I mean, just seeing her brother on stage would probably make her cower.

But now, as she watched over her brother’s resignation, she was staring at him with a firm look.

“I am proud and grateful to have been able to lead the student council for almost two years. Thank you very much.”

After his brief statement, Horikita’s brother quietly retreated and returned to his original position.

There were no moving words in his speech. It could be said that it was a solemn and dutiful statement.

However, it does not look like the retirement ceremony will end with just this.

The student council officers on the stage with him stood firm, not breaking their solid posture.

“Student president Horikita has worked so hard for you all. Now, please welcome the new student council president, second-year student of Class A, Miyabi Nagumo.”

Miyabi Nagumo, the new student president, walked forward and stood in front of the microphone.

Among the student council members warmly watching over him on the stage, the figure of Ichinose could be seen.

“I am Miyabi Nagumo of the second year’s Class A. President Horikita, I really appreciate your strict and kind guidance so far. I am honored and would like to pay tribute to you. I am thankful for being able to accompany the legendary president who has played one of the greatest leadership roles in the history of this school.”

With that, he bowed deeply in the direction of Horikita’s brother, and then re-faced the students.

“Let me introduce myself again. My name is Miyabi Nagumo. I will be the next student president of Advanced Nurturing High School. Please take care of me.”

It was quite different from the attitude I had glimpsed at the sports festival. Nagumo was very polite and gentle. His expression and attitude that he held during the final leg of the relay race had entirely disappeared. But I felt we were only being shown the surface.

Nagumo smiled thin and small so as to change the calm atmosphere.

“I’ll get straight to the point. First of all, I promise to change the terms and appointment method of the student council as well as the practice of the general election. This will mean changing the date of the general election of the student council from December to October. This shift will be an attempt to move to a new generation for the student council and I judge that that then will be when the new student council will move towards a new era. I will change the tenure of the president and officers from terms to indefinite so they can serve until graduation. At the same time, I will abolish the current restrictions on the number of student council officers. In other words, as long as it is an excellent and necessary person, they can become a member of the student council at any time regardless of the number of slots that are open. In the event that someone is judged unfit for office, I will establish a system of majority vote at the meetings for expelling them from their positions. As a starting point, let me make a declaration to the students, teachers, and leaders of the former student council who are assembled here. The school system of the future… I will destroy all that has been preserved by the previous student councils for the sake of the appearance of the school.”

He spoke so forcefully that it seemed to negate all the merits of the former student president who stood behind him.

“I originally wanted to implement this new system immediately, but unfortunately, I cannot do that. This is because the new student president will be bound by various kinds of constraints upon first taking office.”

Nagumo glanced at Horikita, the former student council president, and then turned back to the students.

“I promise that there will be a great revolution in the near future. Students with strength will climb up to the top and those without strength will fall to the bottom. I will turn this school into a real meritocracy, so please show me what you all can do.”

The gymnasium was immediately silenced by his declaration, but almost all the sophomores soon started screaming with joy and became rowdy. Maybe there was a battle between the second years and the third years that we didn’t know about. It was an event that made me feel that way.

(Intro End)')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (6, 4, N'Chapter 1', N'The sports festival ended in mid-October, around the time of year when it started getting chilly.

The school held a general election to decide who would be in charge of the next student council. Immediately after the election concluded, the school ushered in the handover ceremony of the student council. It was a large-scale event that gathered students from the entire school to the gymnasium. However, for most of the first year students, it was a very uneventful experience. They were drowsy, but they were attempting to keep quiet and slow their breathing so the teachers and upperclassmen wouldn’t notice them.

“Now, here are some final remarks from president Horikita of the student council.”

Following the moderator’s speech, Horikita Manabu slowly approached the microphone on the stage.

If it was the Horikita from before, the younger one I mean, just seeing her brother on stage would probably make her cower.

But now, as she watched over her brother’s resignation, she was staring at him with a firm look.

“I am proud and grateful to have been able to lead the student council for almost two years. Thank you very much.”

After his brief statement, Horikita’s brother quietly retreated and returned to his original position.

There were no moving words in his speech. It could be said that it was a solemn and dutiful statement.

However, it does not look like the retirement ceremony will end with just this.

The student council officers on the stage with him stood firm, not breaking their solid posture.

“Student president Horikita has worked so hard for you all. Now, please welcome the new student council president, second-year student of Class A, Miyabi Nagumo.”

Miyabi Nagumo, the new student president, walked forward and stood in front of the microphone.

Among the student council members warmly watching over him on the stage, the figure of Ichinose could be seen.

“I am Miyabi Nagumo of the second year’s Class A. President Horikita, I really appreciate your strict and kind guidance so far. I am honored and would like to pay tribute to you. I am thankful for being able to accompany the legendary president who has played one of the greatest leadership roles in the history of this school.”

With that, he bowed deeply in the direction of Horikita’s brother, and then re-faced the students.

“Let me introduce myself again. My name is Miyabi Nagumo. I will be the next student president of Advanced Nurturing High School. Please take care of me.”

It was quite different from the attitude I had glimpsed at the sports festival. Nagumo was very polite and gentle. His expression and attitude that he held during the final leg of the relay race had entirely disappeared. But I felt we were only being shown the surface.

Nagumo smiled thin and small so as to change the calm atmosphere.

“I’ll get straight to the point. First of all, I promise to change the terms and appointment method of the student council as well as the practice of the general election. This will mean changing the date of the general election of the student council from December to October. This shift will be an attempt to move to a new generation for the student council and I judge that that then will be when the new student council will move towards a new era. I will change the tenure of the president and officers from terms to indefinite so they can serve until graduation. At the same time, I will abolish the current restrictions on the number of student council officers. In other words, as long as it is an excellent and necessary person, they can become a member of the student council at any time regardless of the number of slots that are open. In the event that someone is judged unfit for office, I will establish a system of majority vote at the meetings for expelling them from their positions. As a starting point, let me make a declaration to the students, teachers, and leaders of the former student council who are assembled here. The school system of the future… I will destroy all that has been preserved by the previous student councils for the sake of the appearance of the school.”

He spoke so forcefully that it seemed to negate all the merits of the former student president who stood behind him.

“I originally wanted to implement this new system immediately, but unfortunately, I cannot do that. This is because the new student president will be bound by various kinds of constraints upon first taking office.”

Nagumo glanced at Horikita, the former student council president, and then turned back to the students.

“I promise that there will be a great revolution in the near future. Students with strength will climb up to the top and those without strength will fall to the bottom. I will turn this school into a real meritocracy, so please show me what you all can do.”

The gymnasium was immediately silenced by his declaration, but almost all the sophomores soon started screaming with joy and became rowdy. Maybe there was a battle between the second years and the third years that we didn’t know about. It was an event that made me feel that way.

(Intro End)')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (7, 1, N'Chapter 3', N'The sports festival ended in mid-October, around the time of year when it started getting chilly.

The school held a general election to decide who would be in charge of the next student council. Immediately after the election concluded, the school ushered in the handover ceremony of the student council. It was a large-scale event that gathered students from the entire school to the gymnasium. However, for most of the first year students, it was a very uneventful experience. They were drowsy, but they were attempting to keep quiet and slow their breathing so the teachers and upperclassmen wouldn’t notice them.

“Now, here are some final remarks from president Horikita of the student council.”

Following the moderator’s speech, Horikita Manabu slowly approached the microphone on the stage.

If it was the Horikita from before, the younger one I mean, just seeing her brother on stage would probably make her cower.

But now, as she watched over her brother’s resignation, she was staring at him with a firm look.

“I am proud and grateful to have been able to lead the student council for almost two years. Thank you very much.”

After his brief statement, Horikita’s brother quietly retreated and returned to his original position.

There were no moving words in his speech. It could be said that it was a solemn and dutiful statement.

However, it does not look like the retirement ceremony will end with just this.

The student council officers on the stage with him stood firm, not breaking their solid posture.

“Student president Horikita has worked so hard for you all. Now, please welcome the new student council president, second-year student of Class A, Miyabi Nagumo.”

Miyabi Nagumo, the new student president, walked forward and stood in front of the microphone.

Among the student council members warmly watching over him on the stage, the figure of Ichinose could be seen.

“I am Miyabi Nagumo of the second year’s Class A. President Horikita, I really appreciate your strict and kind guidance so far. I am honored and would like to pay tribute to you. I am thankful for being able to accompany the legendary president who has played one of the greatest leadership roles in the history of this school.”

With that, he bowed deeply in the direction of Horikita’s brother, and then re-faced the students.

“Let me introduce myself again. My name is Miyabi Nagumo. I will be the next student president of Advanced Nurturing High School. Please take care of me.”

It was quite different from the attitude I had glimpsed at the sports festival. Nagumo was very polite and gentle. His expression and attitude that he held during the final leg of the relay race had entirely disappeared. But I felt we were only being shown the surface.

Nagumo smiled thin and small so as to change the calm atmosphere.

“I’ll get straight to the point. First of all, I promise to change the terms and appointment method of the student council as well as the practice of the general election. This will mean changing the date of the general election of the student council from December to October. This shift will be an attempt to move to a new generation for the student council and I judge that that then will be when the new student council will move towards a new era. I will change the tenure of the president and officers from terms to indefinite so they can serve until graduation. At the same time, I will abolish the current restrictions on the number of student council officers. In other words, as long as it is an excellent and necessary person, they can become a member of the student council at any time regardless of the number of slots that are open. In the event that someone is judged unfit for office, I will establish a system of majority vote at the meetings for expelling them from their positions. As a starting point, let me make a declaration to the students, teachers, and leaders of the former student council who are assembled here. The school system of the future… I will destroy all that has been preserved by the previous student councils for the sake of the appearance of the school.”

He spoke so forcefully that it seemed to negate all the merits of the former student president who stood behind him.

“I originally wanted to implement this new system immediately, but unfortunately, I cannot do that. This is because the new student president will be bound by various kinds of constraints upon first taking office.”

Nagumo glanced at Horikita, the former student council president, and then turned back to the students.

“I promise that there will be a great revolution in the near future. Students with strength will climb up to the top and those without strength will fall to the bottom. I will turn this school into a real meritocracy, so please show me what you all can do.”

The gymnasium was immediately silenced by his declaration, but almost all the sophomores soon started screaming with joy and became rowdy. Maybe there was a battle between the second years and the third years that we didn’t know about. It was an event that made me feel that way.

(Intro End)')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (8, 1, N'Chapter 4', N'The sports festival ended in mid-October, around the time of year when it started getting chilly.

The school held a general election to decide who would be in charge of the next student council. Immediately after the election concluded, the school ushered in the handover ceremony of the student council. It was a large-scale event that gathered students from the entire school to the gymnasium. However, for most of the first year students, it was a very uneventful experience. They were drowsy, but they were attempting to keep quiet and slow their breathing so the teachers and upperclassmen wouldn’t notice them.

“Now, here are some final remarks from president Horikita of the student council.”

Following the moderator’s speech, Horikita Manabu slowly approached the microphone on the stage.

If it was the Horikita from before, the younger one I mean, just seeing her brother on stage would probably make her cower.

But now, as she watched over her brother’s resignation, she was staring at him with a firm look.

“I am proud and grateful to have been able to lead the student council for almost two years. Thank you very much.”

After his brief statement, Horikita’s brother quietly retreated and returned to his original position.

There were no moving words in his speech. It could be said that it was a solemn and dutiful statement.

However, it does not look like the retirement ceremony will end with just this.

The student council officers on the stage with him stood firm, not breaking their solid posture.

“Student president Horikita has worked so hard for you all. Now, please welcome the new student council president, second-year student of Class A, Miyabi Nagumo.”

Miyabi Nagumo, the new student president, walked forward and stood in front of the microphone.

Among the student council members warmly watching over him on the stage, the figure of Ichinose could be seen.

“I am Miyabi Nagumo of the second year’s Class A. President Horikita, I really appreciate your strict and kind guidance so far. I am honored and would like to pay tribute to you. I am thankful for being able to accompany the legendary president who has played one of the greatest leadership roles in the history of this school.”

With that, he bowed deeply in the direction of Horikita’s brother, and then re-faced the students.

“Let me introduce myself again. My name is Miyabi Nagumo. I will be the next student president of Advanced Nurturing High School. Please take care of me.”

It was quite different from the attitude I had glimpsed at the sports festival. Nagumo was very polite and gentle. His expression and attitude that he held during the final leg of the relay race had entirely disappeared. But I felt we were only being shown the surface.

Nagumo smiled thin and small so as to change the calm atmosphere.

“I’ll get straight to the point. First of all, I promise to change the terms and appointment method of the student council as well as the practice of the general election. This will mean changing the date of the general election of the student council from December to October. This shift will be an attempt to move to a new generation for the student council and I judge that that then will be when the new student council will move towards a new era. I will change the tenure of the president and officers from terms to indefinite so they can serve until graduation. At the same time, I will abolish the current restrictions on the number of student council officers. In other words, as long as it is an excellent and necessary person, they can become a member of the student council at any time regardless of the number of slots that are open. In the event that someone is judged unfit for office, I will establish a system of majority vote at the meetings for expelling them from their positions. As a starting point, let me make a declaration to the students, teachers, and leaders of the former student council who are assembled here. The school system of the future… I will destroy all that has been preserved by the previous student councils for the sake of the appearance of the school.”

He spoke so forcefully that it seemed to negate all the merits of the former student president who stood behind him.

“I originally wanted to implement this new system immediately, but unfortunately, I cannot do that. This is because the new student president will be bound by various kinds of constraints upon first taking office.”

Nagumo glanced at Horikita, the former student council president, and then turned back to the students.

“I promise that there will be a great revolution in the near future. Students with strength will climb up to the top and those without strength will fall to the bottom. I will turn this school into a real meritocracy, so please show me what you all can do.”

The gymnasium was immediately silenced by his declaration, but almost all the sophomores soon started screaming with joy and became rowdy. Maybe there was a battle between the second years and the third years that we didn’t know about. It was an event that made me feel that way.

(Intro End)')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (9, 5, N'Chapter 3', N'The sports festival ended in mid-October, around the time of year when it started getting chilly.

The school held a general election to decide who would be in charge of the next student council. Immediately after the election concluded, the school ushered in the handover ceremony of the student council. It was a large-scale event that gathered students from the entire school to the gymnasium. However, for most of the first year students, it was a very uneventful experience. They were drowsy, but they were attempting to keep quiet and slow their breathing so the teachers and upperclassmen wouldn’t notice them.

“Now, here are some final remarks from president Horikita of the student council.”

Following the moderator’s speech, Horikita Manabu slowly approached the microphone on the stage.

If it was the Horikita from before, the younger one I mean, just seeing her brother on stage would probably make her cower.

But now, as she watched over her brother’s resignation, she was staring at him with a firm look.

“I am proud and grateful to have been able to lead the student council for almost two years. Thank you very much.”

After his brief statement, Horikita’s brother quietly retreated and returned to his original position.

There were no moving words in his speech. It could be said that it was a solemn and dutiful statement.

However, it does not look like the retirement ceremony will end with just this.

The student council officers on the stage with him stood firm, not breaking their solid posture.

“Student president Horikita has worked so hard for you all. Now, please welcome the new student council president, second-year student of Class A, Miyabi Nagumo.”

Miyabi Nagumo, the new student president, walked forward and stood in front of the microphone.

Among the student council members warmly watching over him on the stage, the figure of Ichinose could be seen.

“I am Miyabi Nagumo of the second year’s Class A. President Horikita, I really appreciate your strict and kind guidance so far. I am honored and would like to pay tribute to you. I am thankful for being able to accompany the legendary president who has played one of the greatest leadership roles in the history of this school.”

With that, he bowed deeply in the direction of Horikita’s brother, and then re-faced the students.

“Let me introduce myself again. My name is Miyabi Nagumo. I will be the next student president of Advanced Nurturing High School. Please take care of me.”

It was quite different from the attitude I had glimpsed at the sports festival. Nagumo was very polite and gentle. His expression and attitude that he held during the final leg of the relay race had entirely disappeared. But I felt we were only being shown the surface.

Nagumo smiled thin and small so as to change the calm atmosphere.

“I’ll get straight to the point. First of all, I promise to change the terms and appointment method of the student council as well as the practice of the general election. This will mean changing the date of the general election of the student council from December to October. This shift will be an attempt to move to a new generation for the student council and I judge that that then will be when the new student council will move towards a new era. I will change the tenure of the president and officers from terms to indefinite so they can serve until graduation. At the same time, I will abolish the current restrictions on the number of student council officers. In other words, as long as it is an excellent and necessary person, they can become a member of the student council at any time regardless of the number of slots that are open. In the event that someone is judged unfit for office, I will establish a system of majority vote at the meetings for expelling them from their positions. As a starting point, let me make a declaration to the students, teachers, and leaders of the former student council who are assembled here. The school system of the future… I will destroy all that has been preserved by the previous student councils for the sake of the appearance of the school.”

He spoke so forcefully that it seemed to negate all the merits of the former student president who stood behind him.

“I originally wanted to implement this new system immediately, but unfortunately, I cannot do that. This is because the new student president will be bound by various kinds of constraints upon first taking office.”

Nagumo glanced at Horikita, the former student council president, and then turned back to the students.

“I promise that there will be a great revolution in the near future. Students with strength will climb up to the top and those without strength will fall to the bottom. I will turn this school into a real meritocracy, so please show me what you all can do.”

The gymnasium was immediately silenced by his declaration, but almost all the sophomores soon started screaming with joy and became rowdy. Maybe there was a battle between the second years and the third years that we didn’t know about. It was an event that made me feel that way.

(Intro End)')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (10, 2, N'Chapter 1', N'Jason Grace awakens on a school bus, unable to remember anything about his past. He is placed next to Piper McLean, his apparent girlfriend and Leo Valdez, his apparent best friend. All three are part of a class field trip to the Grand Canyon, and after they arrive, a classmate, Dylan, turns into a storm spirit and attacks the trio and their trip leader, Coach Gleeson Hedge. In the ensuing fight, Jason battles the spirit and surprises everyone with his powers; Hedge is revealed to be a satyr and is captured by the storm spirit as it flees. A flying chariot with two demigods appear on the scene. The female demigod, Annabeth Chase, expresses her frustration upon seeing that her missing boyfriend, Percy Jackson, is not there as she expected. Jason, Piper, and Leo are told that they are Greek demigods and are taken back to Camp Half-Blood. There, Leo is revealed as a son of Hephaestus, Piper as a daughter of Aphrodite and Jason as a son of Zeus, though Hera tells him he is her champion. 
Leo, who has the rare ability to conjure fire, does not use nor tell anyone about it out of guilt about his mother''s death seven years prior. Meanwhile, Jason finds out about his sister Thalia Grace, a daughter of Zeus and lieutenant of the Hunters of Artemis. In the woods, Leo discovers a damaged mechanical bronze dragon and rejuvenates it. Shortly thereafter, the three are given a quest to rescue Hera from danger. After encountering Boreas, Piper, Jason, and Leo soon discover that their enemies are working under orders from Gaea, the Greek primordial goddess of the Earth, to overthrow the gods. Throughout their journey, they overcome numerous obstacles and eventually manage to save Coach Hedge. During their quest, they meet Thalia and the Hunters, who have also been looking for Percy. Thalia and Jason have a reunion, the first since Jason was two, but soon get separated on the way to Aelous''s castle. After almost being imprisoned by Aeolus under Gaea''s orders, the trio manage to escape and end up in San Francisco. 
They defeat Enceladus at Mount Diablo and rescue Piper''s father, who was being held captive. Jason, Piper and Leo, with the Hunters of Artemis, travel to the Wolf House and defeats the forces of Gaea, saving Hera. They temporarily stall Gaea''s plans, but were unable to completely destroy the ancient beings. Meanwhile, at camp, Leo creates plans for a ship that would sail to Greece, and the Hephaestus campers decide to undergo the project, appointing Leo as their new counselor. With part of his memory returned, Jason realizes that he is a son of Jupiter, a hero from a Roman counterpart camp to Camp Half-Blood called Camp Jupiter somewhere near San Francisco, California. Hera, known as Juno to the Romans, has switched him with the Greek hero Percy Jackson, who is now at the Roman camp with no memory of his previous life. Camp Half-Blood and Camp Jupiter always had a ruthless rivalry; whenever they came into contact, things never ended well')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (11, 2, N'Chapter 2', N'Jason Grace awakens on a school bus, unable to remember anything about his past. He is placed next to Piper McLean, his apparent girlfriend and Leo Valdez, his apparent best friend. All three are part of a class field trip to the Grand Canyon, and after they arrive, a classmate, Dylan, turns into a storm spirit and attacks the trio and their trip leader, Coach Gleeson Hedge. In the ensuing fight, Jason battles the spirit and surprises everyone with his powers; Hedge is revealed to be a satyr and is captured by the storm spirit as it flees. A flying chariot with two demigods appear on the scene. The female demigod, Annabeth Chase, expresses her frustration upon seeing that her missing boyfriend, Percy Jackson, is not there as she expected. Jason, Piper, and Leo are told that they are Greek demigods and are taken back to Camp Half-Blood. There, Leo is revealed as a son of Hephaestus, Piper as a daughter of Aphrodite and Jason as a son of Zeus, though Hera tells him he is her champion. 
Leo, who has the rare ability to conjure fire, does not use nor tell anyone about it out of guilt about his mother''s death seven years prior. Meanwhile, Jason finds out about his sister Thalia Grace, a daughter of Zeus and lieutenant of the Hunters of Artemis. In the woods, Leo discovers a damaged mechanical bronze dragon and rejuvenates it. Shortly thereafter, the three are given a quest to rescue Hera from danger. After encountering Boreas, Piper, Jason, and Leo soon discover that their enemies are working under orders from Gaea, the Greek primordial goddess of the Earth, to overthrow the gods. Throughout their journey, they overcome numerous obstacles and eventually manage to save Coach Hedge. During their quest, they meet Thalia and the Hunters, who have also been looking for Percy. Thalia and Jason have a reunion, the first since Jason was two, but soon get separated on the way to Aelous''s castle. After almost being imprisoned by Aeolus under Gaea''s orders, the trio manage to escape and end up in San Francisco. 
They defeat Enceladus at Mount Diablo and rescue Piper''s father, who was being held captive. Jason, Piper and Leo, with the Hunters of Artemis, travel to the Wolf House and defeats the forces of Gaea, saving Hera. They temporarily stall Gaea''s plans, but were unable to completely destroy the ancient beings. Meanwhile, at camp, Leo creates plans for a ship that would sail to Greece, and the Hephaestus campers decide to undergo the project, appointing Leo as their new counselor. With part of his memory returned, Jason realizes that he is a son of Jupiter, a hero from a Roman counterpart camp to Camp Half-Blood called Camp Jupiter somewhere near San Francisco, California. Hera, known as Juno to the Romans, has switched him with the Greek hero Percy Jackson, who is now at the Roman camp with no memory of his previous life. Camp Half-Blood and Camp Jupiter always had a ruthless rivalry; whenever they came into contact, things never ended well')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (12, 2, N'Chapter 3', N'Jason Grace awakens on a school bus, unable to remember anything about his past. He is placed next to Piper McLean, his apparent girlfriend and Leo Valdez, his apparent best friend. All three are part of a class field trip to the Grand Canyon, and after they arrive, a classmate, Dylan, turns into a storm spirit and attacks the trio and their trip leader, Coach Gleeson Hedge. In the ensuing fight, Jason battles the spirit and surprises everyone with his powers; Hedge is revealed to be a satyr and is captured by the storm spirit as it flees. A flying chariot with two demigods appear on the scene. The female demigod, Annabeth Chase, expresses her frustration upon seeing that her missing boyfriend, Percy Jackson, is not there as she expected. Jason, Piper, and Leo are told that they are Greek demigods and are taken back to Camp Half-Blood. There, Leo is revealed as a son of Hephaestus, Piper as a daughter of Aphrodite and Jason as a son of Zeus, though Hera tells him he is her champion. 
Leo, who has the rare ability to conjure fire, does not use nor tell anyone about it out of guilt about his mother''s death seven years prior. Meanwhile, Jason finds out about his sister Thalia Grace, a daughter of Zeus and lieutenant of the Hunters of Artemis. In the woods, Leo discovers a damaged mechanical bronze dragon and rejuvenates it. Shortly thereafter, the three are given a quest to rescue Hera from danger. After encountering Boreas, Piper, Jason, and Leo soon discover that their enemies are working under orders from Gaea, the Greek primordial goddess of the Earth, to overthrow the gods. Throughout their journey, they overcome numerous obstacles and eventually manage to save Coach Hedge. During their quest, they meet Thalia and the Hunters, who have also been looking for Percy. Thalia and Jason have a reunion, the first since Jason was two, but soon get separated on the way to Aelous''s castle. After almost being imprisoned by Aeolus under Gaea''s orders, the trio manage to escape and end up in San Francisco. 
They defeat Enceladus at Mount Diablo and rescue Piper''s father, who was being held captive. Jason, Piper and Leo, with the Hunters of Artemis, travel to the Wolf House and defeats the forces of Gaea, saving Hera. They temporarily stall Gaea''s plans, but were unable to completely destroy the ancient beings. Meanwhile, at camp, Leo creates plans for a ship that would sail to Greece, and the Hephaestus campers decide to undergo the project, appointing Leo as their new counselor. With part of his memory returned, Jason realizes that he is a son of Jupiter, a hero from a Roman counterpart camp to Camp Half-Blood called Camp Jupiter somewhere near San Francisco, California. Hera, known as Juno to the Romans, has switched him with the Greek hero Percy Jackson, who is now at the Roman camp with no memory of his previous life. Camp Half-Blood and Camp Jupiter always had a ruthless rivalry; whenever they came into contact, things never ended well')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (16, 4, N'Chapter 2', N'Jason Grace awakens on a school bus, unable to remember anything about his past. He is placed next to Piper McLean, his apparent girlfriend and Leo Valdez, his apparent best friend. All three are part of a class field trip to the Grand Canyon, and after they arrive, a classmate, Dylan, turns into a storm spirit and attacks the trio and their trip leader, Coach Gleeson Hedge. In the ensuing fight, Jason battles the spirit and surprises everyone with his powers; Hedge is revealed to be a satyr and is captured by the storm spirit as it flees. A flying chariot with two demigods appear on the scene. The female demigod, Annabeth Chase, expresses her frustration upon seeing that her missing boyfriend, Percy Jackson, is not there as she expected. Jason, Piper, and Leo are told that they are Greek demigods and are taken back to Camp Half-Blood. There, Leo is revealed as a son of Hephaestus, Piper as a daughter of Aphrodite and Jason as a son of Zeus, though Hera tells him he is her champion. 
Leo, who has the rare ability to conjure fire, does not use nor tell anyone about it out of guilt about his mother''s death seven years prior. Meanwhile, Jason finds out about his sister Thalia Grace, a daughter of Zeus and lieutenant of the Hunters of Artemis. In the woods, Leo discovers a damaged mechanical bronze dragon and rejuvenates it. Shortly thereafter, the three are given a quest to rescue Hera from danger. After encountering Boreas, Piper, Jason, and Leo soon discover that their enemies are working under orders from Gaea, the Greek primordial goddess of the Earth, to overthrow the gods. Throughout their journey, they overcome numerous obstacles and eventually manage to save Coach Hedge. During their quest, they meet Thalia and the Hunters, who have also been looking for Percy. Thalia and Jason have a reunion, the first since Jason was two, but soon get separated on the way to Aelous''s castle. After almost being imprisoned by Aeolus under Gaea''s orders, the trio manage to escape and end up in San Francisco. 
They defeat Enceladus at Mount Diablo and rescue Piper''s father, who was being held captive. Jason, Piper and Leo, with the Hunters of Artemis, travel to the Wolf House and defeats the forces of Gaea, saving Hera. They temporarily stall Gaea''s plans, but were unable to completely destroy the ancient beings. Meanwhile, at camp, Leo creates plans for a ship that would sail to Greece, and the Hephaestus campers decide to undergo the project, appointing Leo as their new counselor. With part of his memory returned, Jason realizes that he is a son of Jupiter, a hero from a Roman counterpart camp to Camp Half-Blood called Camp Jupiter somewhere near San Francisco, California. Hera, known as Juno to the Romans, has switched him with the Greek hero Percy Jackson, who is now at the Roman camp with no memory of his previous life. Camp Half-Blood and Camp Jupiter always had a ruthless rivalry; whenever they came into contact, things never ended well')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (17, 4, N'Chapter 3', N'Jason Grace awakens on a school bus, unable to remember anything about his past. He is placed next to Piper McLean, his apparent girlfriend and Leo Valdez, his apparent best friend. All three are part of a class field trip to the Grand Canyon, and after they arrive, a classmate, Dylan, turns into a storm spirit and attacks the trio and their trip leader, Coach Gleeson Hedge. In the ensuing fight, Jason battles the spirit and surprises everyone with his powers; Hedge is revealed to be a satyr and is captured by the storm spirit as it flees. A flying chariot with two demigods appear on the scene. The female demigod, Annabeth Chase, expresses her frustration upon seeing that her missing boyfriend, Percy Jackson, is not there as she expected. Jason, Piper, and Leo are told that they are Greek demigods and are taken back to Camp Half-Blood. There, Leo is revealed as a son of Hephaestus, Piper as a daughter of Aphrodite and Jason as a son of Zeus, though Hera tells him he is her champion. 
Leo, who has the rare ability to conjure fire, does not use nor tell anyone about it out of guilt about his mother''s death seven years prior. Meanwhile, Jason finds out about his sister Thalia Grace, a daughter of Zeus and lieutenant of the Hunters of Artemis. In the woods, Leo discovers a damaged mechanical bronze dragon and rejuvenates it. Shortly thereafter, the three are given a quest to rescue Hera from danger. After encountering Boreas, Piper, Jason, and Leo soon discover that their enemies are working under orders from Gaea, the Greek primordial goddess of the Earth, to overthrow the gods. Throughout their journey, they overcome numerous obstacles and eventually manage to save Coach Hedge. During their quest, they meet Thalia and the Hunters, who have also been looking for Percy. Thalia and Jason have a reunion, the first since Jason was two, but soon get separated on the way to Aelous''s castle. After almost being imprisoned by Aeolus under Gaea''s orders, the trio manage to escape and end up in San Francisco. 
They defeat Enceladus at Mount Diablo and rescue Piper''s father, who was being held captive. Jason, Piper and Leo, with the Hunters of Artemis, travel to the Wolf House and defeats the forces of Gaea, saving Hera. They temporarily stall Gaea''s plans, but were unable to completely destroy the ancient beings. Meanwhile, at camp, Leo creates plans for a ship that would sail to Greece, and the Hephaestus campers decide to undergo the project, appointing Leo as their new counselor. With part of his memory returned, Jason realizes that he is a son of Jupiter, a hero from a Roman counterpart camp to Camp Half-Blood called Camp Jupiter somewhere near San Francisco, California. Hera, known as Juno to the Romans, has switched him with the Greek hero Percy Jackson, who is now at the Roman camp with no memory of his previous life. Camp Half-Blood and Camp Jupiter always had a ruthless rivalry; whenever they came into contact, things never ended wellJason Grace awakens on a school bus, unable to remember anything about his past. He is placed next to Piper McLean, his apparent girlfriend and Leo Valdez, his apparent best friend. All three are part of a class field trip to the Grand Canyon, and after they arrive, a classmate, Dylan, turns into a storm spirit and attacks the trio and their trip leader, Coach Gleeson Hedge. In the ensuing fight, Jason battles the spirit and surprises everyone with his powers; Hedge is revealed to be a satyr and is captured by the storm spirit as it flees. A flying chariot with two demigods appear on the scene. The female demigod, Annabeth Chase, expresses her frustration upon seeing that her missing boyfriend, Percy Jackson, is not there as she expected. Jason, Piper, and Leo are told that they are Greek demigods and are taken back to Camp Half-Blood. There, Leo is revealed as a son of Hephaestus, Piper as a daughter of Aphrodite and Jason as a son of Zeus, though Hera tells him he is her champion. 
Leo, who has the rare ability to conjure fire, does not use nor tell anyone about it out of guilt about his mother''s death seven years prior. Meanwhile, Jason finds out about his sister Thalia Grace, a daughter of Zeus and lieutenant of the Hunters of Artemis. In the woods, Leo discovers a damaged mechanical bronze dragon and rejuvenates it. Shortly thereafter, the three are given a quest to rescue Hera from danger. After encountering Boreas, Piper, Jason, and Leo soon discover that their enemies are working under orders from Gaea, the Greek primordial goddess of the Earth, to overthrow the gods. Throughout their journey, they overcome numerous obstacles and eventually manage to save Coach Hedge. During their quest, they meet Thalia and the Hunters, who have also been looking for Percy. Thalia and Jason have a reunion, the first since Jason was two, but soon get separated on the way to Aelous''s castle. After almost being imprisoned by Aeolus under Gaea''s orders, the trio manage to escape and end up in San Francisco. 
They defeat Enceladus at Mount Diablo and rescue Piper''s father, who was being held captive. Jason, Piper and Leo, with the Hunters of Artemis, travel to the Wolf House and defeats the forces of Gaea, saving Hera. They temporarily stall Gaea''s plans, but were unable to completely destroy the ancient beings. Meanwhile, at camp, Leo creates plans for a ship that would sail to Greece, and the Hephaestus campers decide to undergo the project, appointing Leo as their new counselor. With part of his memory returned, Jason realizes that he is a son of Jupiter, a hero from a Roman counterpart camp to Camp Half-Blood called Camp Jupiter somewhere near San Francisco, California. Hera, known as Juno to the Romans, has switched him with the Greek hero Percy Jackson, who is now at the Roman camp with no memory of his previous life. Camp Half-Blood and Camp Jupiter always had a ruthless rivalry; whenever they came into contact, things never ended well')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (18, 6, N'Chapter 1', N'Jason Grace awakens on a school bus, unable to remember anything about his past. He is placed next to Piper McLean, his apparent girlfriend and Leo Valdez, his apparent best friend. All three are part of a class field trip to the Grand Canyon, and after they arrive, a classmate, Dylan, turns into a storm spirit and attacks the trio and their trip leader, Coach Gleeson Hedge. In the ensuing fight, Jason battles the spirit and surprises everyone with his powers; Hedge is revealed to be a satyr and is captured by the storm spirit as it flees. A flying chariot with two demigods appear on the scene. The female demigod, Annabeth Chase, expresses her frustration upon seeing that her missing boyfriend, Percy Jackson, is not there as she expected. Jason, Piper, and Leo are told that they are Greek demigods and are taken back to Camp Half-Blood. There, Leo is revealed as a son of Hephaestus, Piper as a daughter of Aphrodite and Jason as a son of Zeus, though Hera tells him he is her champion. 
Leo, who has the rare ability to conjure fire, does not use nor tell anyone about it out of guilt about his mother''s death seven years prior. Meanwhile, Jason finds out about his sister Thalia Grace, a daughter of Zeus and lieutenant of the Hunters of Artemis. In the woods, Leo discovers a damaged mechanical bronze dragon and rejuvenates it. Shortly thereafter, the three are given a quest to rescue Hera from danger. After encountering Boreas, Piper, Jason, and Leo soon discover that their enemies are working under orders from Gaea, the Greek primordial goddess of the Earth, to overthrow the gods. Throughout their journey, they overcome numerous obstacles and eventually manage to save Coach Hedge. During their quest, they meet Thalia and the Hunters, who have also been looking for Percy. Thalia and Jason have a reunion, the first since Jason was two, but soon get separated on the way to Aelous''s castle. After almost being imprisoned by Aeolus under Gaea''s orders, the trio manage to escape and end up in San Francisco. 
They defeat Enceladus at Mount Diablo and rescue Piper''s father, who was being held captive. Jason, Piper and Leo, with the Hunters of Artemis, travel to the Wolf House and defeats the forces of Gaea, saving Hera. They temporarily stall Gaea''s plans, but were unable to completely destroy the ancient beings. Meanwhile, at camp, Leo creates plans for a ship that would sail to Greece, and the Hephaestus campers decide to undergo the project, appointing Leo as their new counselor. With part of his memory returned, Jason realizes that he is a son of Jupiter, a hero from a Roman counterpart camp to Camp Half-Blood called Camp Jupiter somewhere near San Francisco, California. Hera, known as Juno to the Romans, has switched him with the Greek hero Percy Jackson, who is now at the Roman camp with no memory of his previous life. Camp Half-Blood and Camp Jupiter always had a ruthless rivalry; whenever they came into contact, things never ended well')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (19, 6, N'Chapter 2', N'Jason Grace awakens on a school bus, unable to remember anything about his past. He is placed next to Piper McLean, his apparent girlfriend and Leo Valdez, his apparent best friend. All three are part of a class field trip to the Grand Canyon, and after they arrive, a classmate, Dylan, turns into a storm spirit and attacks the trio and their trip leader, Coach Gleeson Hedge. In the ensuing fight, Jason battles the spirit and surprises everyone with his powers; Hedge is revealed to be a satyr and is captured by the storm spirit as it flees. A flying chariot with two demigods appear on the scene. The female demigod, Annabeth Chase, expresses her frustration upon seeing that her missing boyfriend, Percy Jackson, is not there as she expected. Jason, Piper, and Leo are told that they are Greek demigods and are taken back to Camp Half-Blood. There, Leo is revealed as a son of Hephaestus, Piper as a daughter of Aphrodite and Jason as a son of Zeus, though Hera tells him he is her champion. 
Leo, who has the rare ability to conjure fire, does not use nor tell anyone about it out of guilt about his mother''s death seven years prior. Meanwhile, Jason finds out about his sister Thalia Grace, a daughter of Zeus and lieutenant of the Hunters of Artemis. In the woods, Leo discovers a damaged mechanical bronze dragon and rejuvenates it. Shortly thereafter, the three are given a quest to rescue Hera from danger. After encountering Boreas, Piper, Jason, and Leo soon discover that their enemies are working under orders from Gaea, the Greek primordial goddess of the Earth, to overthrow the gods. Throughout their journey, they overcome numerous obstacles and eventually manage to save Coach Hedge. During their quest, they meet Thalia and the Hunters, who have also been looking for Percy. Thalia and Jason have a reunion, the first since Jason was two, but soon get separated on the way to Aelous''s castle. After almost being imprisoned by Aeolus under Gaea''s orders, the trio manage to escape and end up in San Francisco. 
They defeat Enceladus at Mount Diablo and rescue Piper''s father, who was being held captive. Jason, Piper and Leo, with the Hunters of Artemis, travel to the Wolf House and defeats the forces of Gaea, saving Hera. They temporarily stall Gaea''s plans, but were unable to completely destroy the ancient beings. Meanwhile, at camp, Leo creates plans for a ship that would sail to Greece, and the Hephaestus campers decide to undergo the project, appointing Leo as their new counselor. With part of his memory returned, Jason realizes that he is a son of Jupiter, a hero from a Roman counterpart camp to Camp Half-Blood called Camp Jupiter somewhere near San Francisco, California. Hera, known as Juno to the Romans, has switched him with the Greek hero Percy Jackson, who is now at the Roman camp with no memory of his previous life. Camp Half-Blood and Camp Jupiter always had a ruthless rivalry; whenever they came into contact, things never ended well')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (20, 6, N'Chapter 3', N'Jason Grace awakens on a school bus, unable to remember anything about his past. He is placed next to Piper McLean, his apparent girlfriend and Leo Valdez, his apparent best friend. All three are part of a class field trip to the Grand Canyon, and after they arrive, a classmate, Dylan, turns into a storm spirit and attacks the trio and their trip leader, Coach Gleeson Hedge. In the ensuing fight, Jason battles the spirit and surprises everyone with his powers; Hedge is revealed to be a satyr and is captured by the storm spirit as it flees. A flying chariot with two demigods appear on the scene. The female demigod, Annabeth Chase, expresses her frustration upon seeing that her missing boyfriend, Percy Jackson, is not there as she expected. Jason, Piper, and Leo are told that they are Greek demigods and are taken back to Camp Half-Blood. There, Leo is revealed as a son of Hephaestus, Piper as a daughter of Aphrodite and Jason as a son of Zeus, though Hera tells him he is her champion. 
Leo, who has the rare ability to conjure fire, does not use nor tell anyone about it out of guilt about his mother''s death seven years prior. Meanwhile, Jason finds out about his sister Thalia Grace, a daughter of Zeus and lieutenant of the Hunters of Artemis. In the woods, Leo discovers a damaged mechanical bronze dragon and rejuvenates it. Shortly thereafter, the three are given a quest to rescue Hera from danger. After encountering Boreas, Piper, Jason, and Leo soon discover that their enemies are working under orders from Gaea, the Greek primordial goddess of the Earth, to overthrow the gods. Throughout their journey, they overcome numerous obstacles and eventually manage to save Coach Hedge. During their quest, they meet Thalia and the Hunters, who have also been looking for Percy. Thalia and Jason have a reunion, the first since Jason was two, but soon get separated on the way to Aelous''s castle. After almost being imprisoned by Aeolus under Gaea''s orders, the trio manage to escape and end up in San Francisco. 
They defeat Enceladus at Mount Diablo and rescue Piper''s father, who was being held captive. Jason, Piper and Leo, with the Hunters of Artemis, travel to the Wolf House and defeats the forces of Gaea, saving Hera. They temporarily stall Gaea''s plans, but were unable to completely destroy the ancient beings. Meanwhile, at camp, Leo creates plans for a ship that would sail to Greece, and the Hephaestus campers decide to undergo the project, appointing Leo as their new counselor. With part of his memory returned, Jason realizes that he is a son of Jupiter, a hero from a Roman counterpart camp to Camp Half-Blood called Camp Jupiter somewhere near San Francisco, California. Hera, known as Juno to the Romans, has switched him with the Greek hero Percy Jackson, who is now at the Roman camp with no memory of his previous life. Camp Half-Blood and Camp Jupiter always had a ruthless rivalry; whenever they came into contact, things never ended well')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (21, 7, N'Chapter 1', N'Jason Grace awakens on a school bus, unable to remember anything about his past. He is placed next to Piper McLean, his apparent girlfriend and Leo Valdez, his apparent best friend. All three are part of a class field trip to the Grand Canyon, and after they arrive, a classmate, Dylan, turns into a storm spirit and attacks the trio and their trip leader, Coach Gleeson Hedge. In the ensuing fight, Jason battles the spirit and surprises everyone with his powers; Hedge is revealed to be a satyr and is captured by the storm spirit as it flees. A flying chariot with two demigods appear on the scene. The female demigod, Annabeth Chase, expresses her frustration upon seeing that her missing boyfriend, Percy Jackson, is not there as she expected. Jason, Piper, and Leo are told that they are Greek demigods and are taken back to Camp Half-Blood. There, Leo is revealed as a son of Hephaestus, Piper as a daughter of Aphrodite and Jason as a son of Zeus, though Hera tells him he is her champion. 
Leo, who has the rare ability to conjure fire, does not use nor tell anyone about it out of guilt about his mother''s death seven years prior. Meanwhile, Jason finds out about his sister Thalia Grace, a daughter of Zeus and lieutenant of the Hunters of Artemis. In the woods, Leo discovers a damaged mechanical bronze dragon and rejuvenates it. Shortly thereafter, the three are given a quest to rescue Hera from danger. After encountering Boreas, Piper, Jason, and Leo soon discover that their enemies are working under orders from Gaea, the Greek primordial goddess of the Earth, to overthrow the gods. Throughout their journey, they overcome numerous obstacles and eventually manage to save Coach Hedge. During their quest, they meet Thalia and the Hunters, who have also been looking for Percy. Thalia and Jason have a reunion, the first since Jason was two, but soon get separated on the way to Aelous''s castle. After almost being imprisoned by Aeolus under Gaea''s orders, the trio manage to escape and end up in San Francisco. 
They defeat Enceladus at Mount Diablo and rescue Piper''s father, who was being held captive. Jason, Piper and Leo, with the Hunters of Artemis, travel to the Wolf House and defeats the forces of Gaea, saving Hera. They temporarily stall Gaea''s plans, but were unable to completely destroy the ancient beings. Meanwhile, at camp, Leo creates plans for a ship that would sail to Greece, and the Hephaestus campers decide to undergo the project, appointing Leo as their new counselor. With part of his memory returned, Jason realizes that he is a son of Jupiter, a hero from a Roman counterpart camp to Camp Half-Blood called Camp Jupiter somewhere near San Francisco, California. Hera, known as Juno to the Romans, has switched him with the Greek hero Percy Jackson, who is now at the Roman camp with no memory of his previous life. Camp Half-Blood and Camp Jupiter always had a ruthless rivalry; whenever they came into contact, things never ended well')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (22, 7, N'Chapter 2', N'Jason Grace awakens on a school bus, unable to remember anything about his past. He is placed next to Piper McLean, his apparent girlfriend and Leo Valdez, his apparent best friend. All three are part of a class field trip to the Grand Canyon, and after they arrive, a classmate, Dylan, turns into a storm spirit and attacks the trio and their trip leader, Coach Gleeson Hedge. In the ensuing fight, Jason battles the spirit and surprises everyone with his powers; Hedge is revealed to be a satyr and is captured by the storm spirit as it flees. A flying chariot with two demigods appear on the scene. The female demigod, Annabeth Chase, expresses her frustration upon seeing that her missing boyfriend, Percy Jackson, is not there as she expected. Jason, Piper, and Leo are told that they are Greek demigods and are taken back to Camp Half-Blood. There, Leo is revealed as a son of Hephaestus, Piper as a daughter of Aphrodite and Jason as a son of Zeus, though Hera tells him he is her champion. 
Leo, who has the rare ability to conjure fire, does not use nor tell anyone about it out of guilt about his mother''s death seven years prior. Meanwhile, Jason finds out about his sister Thalia Grace, a daughter of Zeus and lieutenant of the Hunters of Artemis. In the woods, Leo discovers a damaged mechanical bronze dragon and rejuvenates it. Shortly thereafter, the three are given a quest to rescue Hera from danger. After encountering Boreas, Piper, Jason, and Leo soon discover that their enemies are working under orders from Gaea, the Greek primordial goddess of the Earth, to overthrow the gods. Throughout their journey, they overcome numerous obstacles and eventually manage to save Coach Hedge. During their quest, they meet Thalia and the Hunters, who have also been looking for Percy. Thalia and Jason have a reunion, the first since Jason was two, but soon get separated on the way to Aelous''s castle. After almost being imprisoned by Aeolus under Gaea''s orders, the trio manage to escape and end up in San Francisco. 
They defeat Enceladus at Mount Diablo and rescue Piper''s father, who was being held captive. Jason, Piper and Leo, with the Hunters of Artemis, travel to the Wolf House and defeats the forces of Gaea, saving Hera. They temporarily stall Gaea''s plans, but were unable to completely destroy the ancient beings. Meanwhile, at camp, Leo creates plans for a ship that would sail to Greece, and the Hephaestus campers decide to undergo the project, appointing Leo as their new counselor. With part of his memory returned, Jason realizes that he is a son of Jupiter, a hero from a Roman counterpart camp to Camp Half-Blood called Camp Jupiter somewhere near San Francisco, California. Hera, known as Juno to the Romans, has switched him with the Greek hero Percy Jackson, who is now at the Roman camp with no memory of his previous life. Camp Half-Blood and Camp Jupiter always had a ruthless rivalry; whenever they came into contact, things never ended well')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (23, 8, N'Chapter 1', N'Jason Grace awakens on a school bus, unable to remember anything about his past. He is placed next to Piper McLean, his apparent girlfriend and Leo Valdez, his apparent best friend. All three are part of a class field trip to the Grand Canyon, and after they arrive, a classmate, Dylan, turns into a storm spirit and attacks the trio and their trip leader, Coach Gleeson Hedge. In the ensuing fight, Jason battles the spirit and surprises everyone with his powers; Hedge is revealed to be a satyr and is captured by the storm spirit as it flees. A flying chariot with two demigods appear on the scene. The female demigod, Annabeth Chase, expresses her frustration upon seeing that her missing boyfriend, Percy Jackson, is not there as she expected. Jason, Piper, and Leo are told that they are Greek demigods and are taken back to Camp Half-Blood. There, Leo is revealed as a son of Hephaestus, Piper as a daughter of Aphrodite and Jason as a son of Zeus, though Hera tells him he is her champion. 
Leo, who has the rare ability to conjure fire, does not use nor tell anyone about it out of guilt about his mother''s death seven years prior. Meanwhile, Jason finds out about his sister Thalia Grace, a daughter of Zeus and lieutenant of the Hunters of Artemis. In the woods, Leo discovers a damaged mechanical bronze dragon and rejuvenates it. Shortly thereafter, the three are given a quest to rescue Hera from danger. After encountering Boreas, Piper, Jason, and Leo soon discover that their enemies are working under orders from Gaea, the Greek primordial goddess of the Earth, to overthrow the gods. Throughout their journey, they overcome numerous obstacles and eventually manage to save Coach Hedge. During their quest, they meet Thalia and the Hunters, who have also been looking for Percy. Thalia and Jason have a reunion, the first since Jason was two, but soon get separated on the way to Aelous''s castle. After almost being imprisoned by Aeolus under Gaea''s orders, the trio manage to escape and end up in San Francisco. 
They defeat Enceladus at Mount Diablo and rescue Piper''s father, who was being held captive. Jason, Piper and Leo, with the Hunters of Artemis, travel to the Wolf House and defeats the forces of Gaea, saving Hera. They temporarily stall Gaea''s plans, but were unable to completely destroy the ancient beings. Meanwhile, at camp, Leo creates plans for a ship that would sail to Greece, and the Hephaestus campers decide to undergo the project, appointing Leo as their new counselor. With part of his memory returned, Jason realizes that he is a son of Jupiter, a hero from a Roman counterpart camp to Camp Half-Blood called Camp Jupiter somewhere near San Francisco, California. Hera, known as Juno to the Romans, has switched him with the Greek hero Percy Jackson, who is now at the Roman camp with no memory of his previous life. Camp Half-Blood and Camp Jupiter always had a ruthless rivalry; whenever they came into contact, things never ended well')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (24, 9, N'Chapter 1', N'Jason Grace awakens on a school bus, unable to remember anything about his past. He is placed next to Piper McLean, his apparent girlfriend and Leo Valdez, his apparent best friend. All three are part of a class field trip to the Grand Canyon, and after they arrive, a classmate, Dylan, turns into a storm spirit and attacks the trio and their trip leader, Coach Gleeson Hedge. In the ensuing fight, Jason battles the spirit and surprises everyone with his powers; Hedge is revealed to be a satyr and is captured by the storm spirit as it flees. A flying chariot with two demigods appear on the scene. The female demigod, Annabeth Chase, expresses her frustration upon seeing that her missing boyfriend, Percy Jackson, is not there as she expected. Jason, Piper, and Leo are told that they are Greek demigods and are taken back to Camp Half-Blood. There, Leo is revealed as a son of Hephaestus, Piper as a daughter of Aphrodite and Jason as a son of Zeus, though Hera tells him he is her champion. 
Leo, who has the rare ability to conjure fire, does not use nor tell anyone about it out of guilt about his mother''s death seven years prior. Meanwhile, Jason finds out about his sister Thalia Grace, a daughter of Zeus and lieutenant of the Hunters of Artemis. In the woods, Leo discovers a damaged mechanical bronze dragon and rejuvenates it. Shortly thereafter, the three are given a quest to rescue Hera from danger. After encountering Boreas, Piper, Jason, and Leo soon discover that their enemies are working under orders from Gaea, the Greek primordial goddess of the Earth, to overthrow the gods. Throughout their journey, they overcome numerous obstacles and eventually manage to save Coach Hedge. During their quest, they meet Thalia and the Hunters, who have also been looking for Percy. Thalia and Jason have a reunion, the first since Jason was two, but soon get separated on the way to Aelous''s castle. After almost being imprisoned by Aeolus under Gaea''s orders, the trio manage to escape and end up in San Francisco. 
They defeat Enceladus at Mount Diablo and rescue Piper''s father, who was being held captive. Jason, Piper and Leo, with the Hunters of Artemis, travel to the Wolf House and defeats the forces of Gaea, saving Hera. They temporarily stall Gaea''s plans, but were unable to completely destroy the ancient beings. Meanwhile, at camp, Leo creates plans for a ship that would sail to Greece, and the Hephaestus campers decide to undergo the project, appointing Leo as their new counselor. With part of his memory returned, Jason realizes that he is a son of Jupiter, a hero from a Roman counterpart camp to Camp Half-Blood called Camp Jupiter somewhere near San Francisco, California. Hera, known as Juno to the Romans, has switched him with the Greek hero Percy Jackson, who is now at the Roman camp with no memory of his previous life. Camp Half-Blood and Camp Jupiter always had a ruthless rivalry; whenever they came into contact, things never ended well')
INSERT [dbo].[Chapter] ([ChapterID], [BookID], [Title], [Content]) VALUES (25, 9, N'Chapter 1', N'Jason Grace awakens on a school bus, unable to remember anything about his past. He is placed next to Piper McLean, his apparent girlfriend and Leo Valdez, his apparent best friend. All three are part of a class field trip to the Grand Canyon, and after they arrive, a classmate, Dylan, turns into a storm spirit and attacks the trio and their trip leader, Coach Gleeson Hedge. In the ensuing fight, Jason battles the spirit and surprises everyone with his powers; Hedge is revealed to be a satyr and is captured by the storm spirit as it flees. A flying chariot with two demigods appear on the scene. The female demigod, Annabeth Chase, expresses her frustration upon seeing that her missing boyfriend, Percy Jackson, is not there as she expected. Jason, Piper, and Leo are told that they are Greek demigods and are taken back to Camp Half-Blood. There, Leo is revealed as a son of Hephaestus, Piper as a daughter of Aphrodite and Jason as a son of Zeus, though Hera tells him he is her champion. 
Leo, who has the rare ability to conjure fire, does not use nor tell anyone about it out of guilt about his mother''s death seven years prior. Meanwhile, Jason finds out about his sister Thalia Grace, a daughter of Zeus and lieutenant of the Hunters of Artemis. In the woods, Leo discovers a damaged mechanical bronze dragon and rejuvenates it. Shortly thereafter, the three are given a quest to rescue Hera from danger. After encountering Boreas, Piper, Jason, and Leo soon discover that their enemies are working under orders from Gaea, the Greek primordial goddess of the Earth, to overthrow the gods. Throughout their journey, they overcome numerous obstacles and eventually manage to save Coach Hedge. During their quest, they meet Thalia and the Hunters, who have also been looking for Percy. Thalia and Jason have a reunion, the first since Jason was two, but soon get separated on the way to Aelous''s castle. After almost being imprisoned by Aeolus under Gaea''s orders, the trio manage to escape and end up in San Francisco. 
They defeat Enceladus at Mount Diablo and rescue Piper''s father, who was being held captive. Jason, Piper and Leo, with the Hunters of Artemis, travel to the Wolf House and defeats the forces of Gaea, saving Hera. They temporarily stall Gaea''s plans, but were unable to completely destroy the ancient beings. Meanwhile, at camp, Leo creates plans for a ship that would sail to Greece, and the Hephaestus campers decide to undergo the project, appointing Leo as their new counselor. With part of his memory returned, Jason realizes that he is a son of Jupiter, a hero from a Roman counterpart camp to Camp Half-Blood called Camp Jupiter somewhere near San Francisco, California. Hera, known as Juno to the Romans, has switched him with the Greek hero Percy Jackson, who is now at the Roman camp with no memory of his previous life. Camp Half-Blood and Camp Jupiter always had a ruthless rivalry; whenever they came into contact, things never ended well')
SET IDENTITY_INSERT [dbo].[Chapter] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [UserID], [BookID], [Content]) VALUES (3, N'huy', 2, N'ssdas')
INSERT [dbo].[Comment] ([CommentID], [UserID], [BookID], [Content]) VALUES (4, N'linh', 2, N'eqweq')
INSERT [dbo].[Comment] ([CommentID], [UserID], [BookID], [Content]) VALUES (5, N'linh', 2, N'mlmlml')
INSERT [dbo].[Comment] ([CommentID], [UserID], [BookID], [Content]) VALUES (6, N'linh', 2, N'mlmlmlbdfb')
INSERT [dbo].[Comment] ([CommentID], [UserID], [BookID], [Content]) VALUES (8, N'linh', 1, N'')
INSERT [dbo].[Comment] ([CommentID], [UserID], [BookID], [Content]) VALUES (9, N'linh', 1, N'645646')
INSERT [dbo].[Comment] ([CommentID], [UserID], [BookID], [Content]) VALUES (10, N'linh', 5, N'Abc')
SET IDENTITY_INSERT [dbo].[Comment] OFF
INSERT [dbo].[Users] ([UserID], [Email], [Password], [Address], [Phone], [Type], [Avatar]) VALUES (N'', N'', N'', N'', 0, N'User', N'')
INSERT [dbo].[Users] ([UserID], [Email], [Password], [Address], [Phone], [Type], [Avatar]) VALUES (N'admin', N'abc', N'admin', N'abc', 12, N'Admin', NULL)
INSERT [dbo].[Users] ([UserID], [Email], [Password], [Address], [Phone], [Type], [Avatar]) VALUES (N'binh', N'123', N'hfgd', N'444', 123, N'User', NULL)
INSERT [dbo].[Users] ([UserID], [Email], [Password], [Address], [Phone], [Type], [Avatar]) VALUES (N'huy', N'123', N'123', N'123', 123, N'User', NULL)
INSERT [dbo].[Users] ([UserID], [Email], [Password], [Address], [Phone], [Type], [Avatar]) VALUES (N'linh', N'123', N'123', N'123', 123, N'User', N'')
INSERT [dbo].[Users] ([UserID], [Email], [Password], [Address], [Phone], [Type], [Avatar]) VALUES (N'trung', N'123', N'hfgd', N'456', 465, N'User', N'')
INSERT [dbo].[Users] ([UserID], [Email], [Password], [Address], [Phone], [Type], [Avatar]) VALUES (N'user', N'abc', N'user', N'abc', 12, N'User', NULL)
SET IDENTITY_INSERT [dbo].[VoteScore] ON 

INSERT [dbo].[VoteScore] ([VoteID], [UserID], [BookID], [Score]) VALUES (1, N'linh', 1, 7)
INSERT [dbo].[VoteScore] ([VoteID], [UserID], [BookID], [Score]) VALUES (4, N'binh', 1, 5)
INSERT [dbo].[VoteScore] ([VoteID], [UserID], [BookID], [Score]) VALUES (6, N'linh', 2, 3)
INSERT [dbo].[VoteScore] ([VoteID], [UserID], [BookID], [Score]) VALUES (7, N'admin', 1, 5)
INSERT [dbo].[VoteScore] ([VoteID], [UserID], [BookID], [Score]) VALUES (8, N'binh', 2, 9)
INSERT [dbo].[VoteScore] ([VoteID], [UserID], [BookID], [Score]) VALUES (9, N'huy', 2, 10)
INSERT [dbo].[VoteScore] ([VoteID], [UserID], [BookID], [Score]) VALUES (10, N'huy', 1, 6)
INSERT [dbo].[VoteScore] ([VoteID], [UserID], [BookID], [Score]) VALUES (11, N'linh', 5, 10)
INSERT [dbo].[VoteScore] ([VoteID], [UserID], [BookID], [Score]) VALUES (12, N'linh', 6, 4)
INSERT [dbo].[VoteScore] ([VoteID], [UserID], [BookID], [Score]) VALUES (13, N'huy', 5, 6)
INSERT [dbo].[VoteScore] ([VoteID], [UserID], [BookID], [Score]) VALUES (14, N'linh', 8, 5)
SET IDENTITY_INSERT [dbo].[VoteScore] OFF
/****** Object:  Index [UQ__Book_Cat__9C70518486609310]    Script Date: 7/26/2019 12:23:36 AM ******/
ALTER TABLE [dbo].[Book_Category] ADD UNIQUE NONCLUSTERED 
(
	[BookID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book_Category]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Book_Category]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[BookRequest]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Chapter]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[VoteScore]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[VoteScore]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
USE [master]
GO
ALTER DATABASE [PRN292_Assignment] SET  READ_WRITE 
GO
