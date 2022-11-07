Meiroku.df <- read.table("http://history.emory.edu/RAVINA/JF_text_mining/Guides/data/meiroku_zasshi.txt", 
                         header = TRUE, stringsAsFactors = FALSE)

length(Meiroku.df$author)
length(unique(Meiroku.df$author))
length(unique(Meiroku.df))
ncol(Meiroku.df)
nrow(Meiroku.df)
Meiroku.df$author[2] #gets the second element of the vector
Meiroku.df$author[c(2:5)] #gets you from 2-5 in data frame, always include c colon means all the way to
Meiroku.df$text[123]
Meiroku.df$text[14]
Meiroku.df[c(2,6:8,10),c(3:4)] #remember rc first rows and then columns
Meiroku.df[1,3]
Meiroku.df[c(1:4),5]  #for some reason produces white space
Meiroku.df[c(2,6:8,10),c(3:4)] #clear consul with command under edit menu
Meiroku.df[,4] #a blank means -nothings means everything  gives all authors from collumn 
Meiroku.df[1, ]
Meiroku.df[c(1:6),"year"] #you can refer to collumns by their name
Meiroku.df[c(1:6),c("issues","year")]
x <- 3 #telling R that x equals 3
x
x==3  # double equals asks R about the value
Meiroku.df$author[3] #asks who author 3 is
Meiroku.df$author[3]=="福沢諭吉" #checks if author of 3rd entry is Fukuzawa
which(Meiroku.df$author=="福沢諭吉") #this can tell you Which texts are by Fukuzawa
Fukuzawa_nums <- which(Meiroku.df$author=="福沢諭吉")
Fukuzawa_nums
Meiroku.df$title[Fukuzawa_nums]

grepl(pattern = "西洋", x =Meiroku.df$text)  #lets you see which texts written by seiyo
which(grepl(pattern = "西洋", x =Meiroku.df$text)) #lets you search for texts with specific words

Meiroku.df$title[which(grepl(pattern = "男女",x =Meiroku.df$text))] #lets you search for texts with 

Meiroku.df$author[which(grepl(pattern = "男女",x =Meiroku.df$text))]

Meiroku.df$title[Fukuzawa_nums]

Meiroku.df$title[which(grepl(pattern = "健剛",x =Meiroku.df$text))] #searches for titles with term健剛

Meiroku.df$issue[5]

install.packages("stringr") ## run only once packages are bundles of code instaling a package just means it is on your hard drive
library(stringr) ## run with each new R session strings are texts

str_count(string = Meiroku.df$text, pattern = "女")#counts strings  here target of the search is Meiroku.df$text, pattern tells it what to look for 

str_count(string = Meiroku.df$text, pattern = "女")>=5  #tells you which have five onna or more

which(str_count(string = Meiroku.df$text, pattern = "女")>=5) #tells you which use onn five or more times
#square bracketing for subsetting, round for general arguments
#grepl--look for something, patter--what to look for
unique(
Meiroku.df$author[which(str_count(string = Meiroku.df$text, pattern = "女")>=5&
                          Meiroku.df$year>1874)])#

Unique(str_count(string = Meiroku.df$author, pattern = "福沢諭吉"))
Meiroku.df$女 <-　str_count(string = Meiroku.df$text, pattern = "女") #creates a new column in data frame

Meiroku.df$男 <-　str_count(string = Meiroku.df$text, pattern = "男")

install.packages("ggplot2") ## run only once
install.packages("plotly") ## run only once

Meiroku.df$自由 <-　str_count(string = Meiroku.df$text, pattern = "自由 ")

ggplot(data=Meiroku.df, mapping=aes(x=女,y=自由,label=author)) + geom_point()　#creates a plot of onna and jiyu

ggplot(data=Meiroku.df, mapping=aes(x=男,y=自由,label=author)) + geom_point()

da_plot <- ggplot(data=Meiroku.df, mapping=aes(x=男,y=自由,label=author)) + 
  geom_jitter() + ggtitle("Gender in the Meiroku Zasshi") + theme_grey(base_family = "MS Mincho")
ggplotly(da_plot)

Meiroku.df$男 <-　str_count(string = Meiroku.df$text, pattern = "男")/nchar(Meiroku.df$text)*100
Meiroku.df$自由 <-　str_count(string = Meiroku.df$text, pattern = "自由")/nchar(Meiroku.df$text)*100
Meiroku.df$女 <-　str_count(string = Meiroku.df$text, pattern = "女")/nchar(Meiroku.df$text)*100
ggplot(da_plot)
ggplotly(da_plot)

ggplotly(ggplot(data=Meiroku.df, mapping=aes(x=issue,y=女,label=author)) + geom_point())

ggplot(data=Meiroku.df, mapping=aes(x=issue,y=女)) + geom_col()

ggplot(data=Meiroku.df, mapping=aes(x=as.character(year),y=女)) + geom_boxplot()

ggplot(data=Meiroku.df, mapping=aes(x=as.character(year),y=女)) + geom_violin() + coord_flip()
str_extract_all(string = "これはペンです", pattern = "は", simplify = TRUE)
str_extract_all(string = "これはペンです", pattern = "は.", simplify = TRUE)
str_extract_all(string = "これはペンです", pattern = ".は.", simplify = TRUE)

str_extract_all(string = "これはペンです", pattern = "は...", simplify = TRUE)
str_extract_all(string = "これはペンです", pattern = "は*", simplify = TRUE)
str_extract_all(string = "これはペンです", pattern = "は.*$", simplify = TRUE)
#you can look at regex cheat sheet $ is all the way to the end of the string
# . means anything before gives you character beforre. 

str_extract_all(string = "これはペンです", pattern = "^.", simplify = TRUE)
rescript <- "朕惟フニ我カ皇祖皇宗國ヲ肇ムルコト宏遠ニ德ヲ樹ツルコト深厚ナリ我カ臣民克ク忠ニ克ク孝ニ億兆心ヲ一ニシテ世世厥ノ美ヲ濟セルハ此レ我カ國體ノ精華ニシテ敎育ノ淵源亦實ニ此ニ存ス爾臣民父母ニ孝ニ兄弟ニ友ニ夫婦相和シ朋友相信シ恭儉己レヲ持シ博愛衆ニ及ホシ學ヲ修メ業ヲ習ヒ以テ智能ヲ啓發シ德器ヲ成就シ進テ公益ヲ廣メ世務ヲ開キ常ニ國憲ヲ重シ國法ニ遵ヒ一旦緩急アレハ義勇公ニ奉シ以テ天壤無窮ノ皇運ヲ扶翼スヘシ是ノ如キハ獨リ朕カ忠良ノ臣民タルノミナラス又以テ爾祖先ノ遺風ヲ顯彰スルニ足ラン斯ノ道ハ實ニ我カ皇祖皇宗ノ遺訓ニシテ子孫臣民ノ俱ニ遵守スヘキ所之ヲ古今ニ通シテ謬ラス之ヲ中外ニ施シテ悖ラス朕爾臣民ト俱ニ拳々服膺シテ咸其德ヲ一ニセンコトヲ庶幾フ"
str_extract_all(string = rescript, pattern = "國.", simplify = TRUE) #searches for kuni in the value rescript
#you can find some of the commands in regex forums
#i defined rescript with a string of characters. simplify = TRUE makes it more usable
#unlist turns text into one large vector

str_extract_all(string = rescript, pattern = "國\\p{Han}", simplify = TRUE)

str_extract_all(string = rescript, pattern = "國\\p{Katakana}", simplify = TRUE)
str_extract_all(string = rescript, pattern = "國\\p{Hiragana}", simplify = TRUE)

str_extract_all(string = rescript, pattern = "國\\p{Han}.", simplify = TRUE)

str_extract_all(Meiroku.df$text, pattern = "女.", simplify = TRUE)
onna <- unlist(str_extract_all(Meiroku.df$text, pattern = ".女"))
unique(onna)
data.frame(table(onna))
onna.df <- data.frame

str_extract_all(string = rescript, pattern = "朕.*民")　#greedy text search, looks from chin to last min

str_extract_all(string = rescript, pattern = "朕.*?民") # skinnyy search, stops at firs min

str_extract_all(string = rescript, pattern = "\\p{Han}{2}", simplify = TRUE)
#returns all two-character compound

length(unique(unlist(str_extract_all(string = rescript, pattern = "\\p{Han}{2}", simplify = TRUE)
)))

length(unique(unlist(str_extract_all(string = rescript, pattern = "\\p{Han}{3}", simplify = TRUE)
)))  #tells you the number of unique number of 3 character compounds
#\\b is a boundary


length(unique(unlist(str_extract_all(string = Meiroku.df$text, pattern = "\\b\\p{Han}{4}", simplify = TRUE)
)))
list_example <- str_extract_all(string = Meiroku.df$text, pattern = "\\b\\p{Han}{4}", simplify = TRUE)


#if you are taking a text that is not tolkeinize, NINJAL has a nice online interface 

#chijin no ai --tolkienizing
#the below strings are a way to find word frequency

Tanizaki <- read.csv("~/Downloads/webchamame_20190411055319.csv", comment.char="#", stringsAsFactors=FALSE)
whitespace_text <- paste(Tanizaki$書字形..表層形., collapse = " ")
Tanizaki_words.df <- data.frame(table(Tanizaki$書字形..表層形.))
Tanizaki_words.df <- Tanizaki_words.df[order(-Tanizaki_words.df$Freq),]
Tanizaki_words.df[1:50,]
Tanizaki$書字形..表層形.[which(str_count(Tanizaki$書字形..表層形.,"\\p{Han}")>0)]

Tanizaki_real_words.df <-data.frame(table(Tanizaki$書字形..表層形.[which(str_count(Tanizaki$書字形..表層形.,"\\p{Han}")>2)]
))
table(Tanzaki$書字形..表層形.)

Tanizaki_words.df <- Tanizaki_words.df[which(str_count(Tanizaki_words.df$Var1,"\\p{Han}")>0),]
Tanizaki_words.df[1:50,]

top_words <- Tanizaki_real_words.df

