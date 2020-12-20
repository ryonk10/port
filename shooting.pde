 /*
@pjs preload="data/billhaikei.png";
@pjs preload="data/billnaka.png";
@pjs preload="data/billmae.png";
@pjs preload="data/chara.png";
@pjs preload="data/enemyzako.png";
@pjs preload="data/enemyreza.png";
@pjs preload="data/icontuujyou.png";
@pjs preload="data/icongatoring.png";
@pjs preload="data/iconcanon.png";
@pjs preload="data/iconrazer.png";
@pjs preload="data/iconheal.png";
@pjs preload="data/icondebafu.png";
@pjs preload="data/boss.png";
*/

/*
kitai();
boss(ex,ey,enumber,life);
zako(ex,ey,enumber);
   
kougeki1(      
, //ex
, //ey
, //number
, //namimode
, //speed
, //kakuspeed
, //kakudo
, //kakuhani
, //time
, //start
, //end
, //kazu
);//kankaku----------------------------reset:etc[number]
                
kougekinami(      
, //ex
, //ey
, //number
, //speed
, //kakuspeed
, //kakuhani
, //time
, //start
, //end
, //kazu
); //kankaku----------------------------reset:etc[number]
              
kougekihajou(      
, //ex
, //ey
, //number
, //speed
, //kakuhani
, //time
, //start
, //end
, //kazu
, //hajoukazu
);//kankaku  ----------------------------reset:etc[number]=0
               
kougekireezayoko(ex,ey,number);--------------------------------reset:reza=0,rezacount=0
kougekireezatate(ex,ey,number);

koudou1(
, //ue_left
, //sita_right
, //number
, //koudoumode(0:down_←,1:up_→)
, //stoptime
);//koudoutime-----------------------------reset:stop[number]=0
                  
shot(kx,ky);
itemjuu(x,y,mode);
itemdebafu(x,y,item);item 0:speeddown 1:heal
edamage(ex,ey,type,enumber);type 0:zako 1:boss

kougekireset---- 
for(n=0;n<=;n++)
{
elife[n]=0;
etc[n]=0;
stop[n]=0;
koudoux[n]=1090;
}
                 
rezareset------- 
for(n=0;n<=;n++)
{
reza[n]=0;
rezacount[n]=0;
stop[n]=0;
koudoux[n]=1090;
}

*/
PImage billhaikei,billnaka1,billnaka2,billmae1,billmae2,chara,enemyzako,enemyreza,icontuujyou,icongatoring,iconcanon,iconrazer,iconheal,icondebafu,boss;
float siz,get,shotmode,shottime,faze,sfaze,enumber,shotdame,temptime,shotreza,shotrezay,shotrezacount,billhaikeix,bomcolor;
int n,m,ktc1,zakocount,nami2,nami3,ix,iy,billnakax,billmaex,itemtime,itemcount,muteki,bom,bomcount,bossrezacount,bossrezamode,bossrezaswitch;
float easing=0.01;
float kx,ky;
float klife;
int[] ex=new int[21];
float[] ey=new float[21];
float[] itemcooltime=new float[10];
float[] pex=new float[21];
float[] pey=new float[21];
float[] zakospeed=new float[21];
float[] elife=new float[100];//4times
float[] ktx=new float[30];
float[] kty=new float[30];
float[] etx=new float[200];
float[] ety=new float[200];
int[] shyoutotu=new int[100];
int[] etc=new int[21];
int[] koudoux=new int[21];//reset:koudoux[]=1090
float[] koudouy=new float[21];
float[] kou=new float[21];
int[] stop=new int[21];
int[] reza=new int[21];
int[] za=new int[21];
int[] rezacount=new int[21];
int[] kakucount=new int[200];
void setup()
{
  size(1067,600);
  billhaikei=loadImage("data/billhaikei.png");
  billnaka1=loadImage("data/billnaka.png");
  billnaka2=loadImage("data/billnaka.png");
  billmae1=loadImage("data/billmae.png");
  billmae2=loadImage("data/billmae.png");
  chara=loadImage("data/chara.png");
  enemyzako=loadImage("data/enemyzako.png");
  enemyreza=loadImage("data/enemyreza.png");
  icontuujyou=loadImage("data/icontuujyou.png");
  icongatoring=loadImage("data/icongatoring.png");
  iconcanon=loadImage("data/iconcanon.png");
  iconrazer=loadImage("data/iconrazer.png");
  iconheal=loadImage("data/iconheal.png");
  icondebafu=loadImage("data/icondebafu.png");
  boss=loadImage("data/boss.png");
  
  for(n=0;n<200;n++)
  kakucount[n]=n;
  for(n=0;n<21;n++)
  {
  koudoux[n]=1090;
  pex[n]=random(850,1000);
  pey[n]=random(120,520);
  zakospeed[n]=random(4,10);
  }
}

void draw()
{
  background(billhaikei);
  fill(255);
  
  image(billnaka1,billnakax,0);
  image(billnaka2,billnakax+2134,0);
  billnakax=billnakax-1;
  if(billnakax==-2135)
  billnakax=0;
  
  kx+=(mouseX-kx)*easing;
  ky+=(mouseY-ky)*easing;
  //----------------------------------------------------------start
  if(faze==0)
  {
    cursor();
    push();
    noFill();
    strokeWeight(5);
    stroke(255);
    rectMode(CENTER);
    rect(width/2,height/2,146,90);
    textSize(25);
    text("Let's Play",width/2-56,height/2+10);
    pop();
    if(mousePressed==true)
    {
      if(((width/2-73)<=mouseX)&&(mouseX<=(width/2+73))&&((height/2-45)<=mouseY)&&(mouseY<=(height/2+45)))
      {
        noCursor();
        kx=0;
        ky=height/2;
        faze++;
      }
    }
  }
  //----------------------------------------------------------end
  if(faze==8)
  {
    push();
    noFill();
    stroke(255);
    textSize(50);
    text("Congratulations!",width/2-230,height/2);
    textSize(30);
    text("You must be a person with a lot of free time",width/2-330,height/2+100);
    pop();
  }
  if(faze==-1)
  {
    cursor();
    if(mousePressed==true)
    {
      if(((width/2-73)<=mouseX)&&(mouseX<=(width/2+73))&&((height/2-25+50)<=mouseY)&&(mouseY<=(height/2+25+50)))
      {
        kx=0;
        ky=height/2;
        klife=0;
        faze=1;
      }
    }
    for(n=0;n<21;n++)
    {
      koudoux[n]=1090;
      elife[n]=0;
      etc[n]=0;
      za[n]=0;
      stop[n]=0;
      reza[n]=0;
      rezacount[n]=0;
      pex[n]=random(850,1000);
      pey[n]=random(80,520);
      zakospeed[n]=random(4,10);
    }
    for(n=0;n<200;n++)
    {
      kakucount[n]=n;
      etx[n]=0;
      ety[n]=0;
    }
    for(n=0;n<30;n++)
    {
      ktx[n]=0;
      kty[n]=0;
    }
    easing=0.01;
    itemcount=0;
    shotmode=0;
    sfaze=0;
    zakocount=0;
    ix=0;
    bom=0;
    bomcount=0;
    bomcolor=0;
    bossrezamode=0;
    bossrezaswitch=0;
    push();
    noFill();
    strokeWeight(2);
    stroke(255);
    rectMode(CENTER);
    rect(width/2-30,height/2+50,145,35);
    textSize(20);
    fill(255);
    text("Let's Retry!!",width/2-85,height/2+55);
    textSize(50);
    if(temptime%2==0)
    {
      text("What?",width/2-100,height/2);
    }
    else 
    {
      text("Hey,hey!",width/2-130,height/2);
    }
    pop();
  }
  //---------------------------------------------------------game
  if(faze==1)
  {
    noCursor();
    if(((mouseX-60)<=kx)&&(kx<=(mouseX+60))&&((mouseY-60)<=ky)&&(ky<=(mouseY+60)))
    {
      easing=0.1;
      faze++;
    }
    else
      kitai();
  }
  
  if(1<faze)
  {
    shot(kx,ky);
    kitai();
    if(faze==2)
    {
      if(elife[0]>=4)
      {
        faze++;
        elife[0]=0;
        etc[0]=0;
        stop[0]=0;
        koudoux[0]=1090;
      }
      else if(850<=koudoux[0])
      {
        ex[0]=koudoux[0];
        ey[0]=height/2;
        zako(ex[0],ey[0]);
        koudoux[0]=koudoux[0]-2;
      }
      else
      {
        zako(ex[0],ey[0]);   
        kougeki1( ex[0]     , //ex
               ey[0], //ey
               0, //etcount
               5, //speed
               0, //kakudo
               300, //time
               0, //start
               3, //end
               4, //kazu
               150);//kankaku
        edamage(ex[0],ey[0],0,0);
      }
    }
    if(faze==3)
    {
      if(elife[0]>=4)
        elife[0]=10;
      else if(850<=koudoux[0])
      {
        koudoux[0]=koudoux[0]-2;
        ex[0]=koudoux[0];
        zako(ex[0],500);
      }
      else
      {
        koudou1( 500        , //ue_left
                 100 , //sita_right
                  0, //number
                  0, //koudoumode(0:down_←,1:up_→)
                  200, //stoptime
                  100);//koudoutime-----------------------------reset:stop[]
        ey[0]=koudouy[0];
        zako(ex[0],ey[0]);   
        kougeki1( ex[0]     , //ex
               ey[0], //ey
               0, //etcount
               5, //speed
               0, //kakudo
               300, //time
               0, //start
               10, //end
               4, //kazu
               150);//kankaku
        edamage(ex[0],ey[0],0,0);
      }
      if(elife[1]>=4)
        elife[1]=10;
      else if(900<=koudoux[1])
      {
        ex[1]=koudoux[1];
        zako(ex[1],100);
        koudoux[1]=koudoux[1]-2;
      }
      else
      {
        koudou1( 500        , //ue_left
                 100 , //sita_right
                  1, //number
                  1, //koudoumode(0:down_←,1:up_→)
                  200, //stoptime
                  100);//koudoutime-----------------------------reset:stop[]
        ey[1]=koudouy[1];
        zako(ex[1],ey[1]);   
        kougeki1( ex[1]     , //ex
               ey[1], //ey
               1, //etcount
               5, //speed
               0, //kakudo
               300, //time
               11, //start
               20, //end
               4, //kazu
               150);//kankaku
        edamage(ex[1],ey[1],0,1);
      }
      if((elife[0]==10)&&(elife[1]==10))
      {
        faze++;
        elife[0]=0;
        elife[1]=0;
        etc[0]=0;
        etc[1]=0;
        stop[0]=0;
        stop[1]=0;
        koudoux[0]=1190;
        koudoux[1]=1190;
        koudoux[2]=1400;
        temptime=frameCount;
      }
    }
    if(faze==4)
    {
      if(ix<1100)
      {
        itemjuu(1090-ix,450,2);
        itemjuu(1090-ix,300,3);
        itemjuu(1090-ix,150,1);
        ix=ix+3;
      }
      if(elife[0]>=4)
        elife[0]=10;
      else if(850<=koudoux[0])
      {
        koudoux[0]=koudoux[0]-2;
        ex[0]=koudoux[0];
        zako(ex[0],475);
      }
      else
      {
        koudou1( 475        , //ue_left
                 350 , //sita_right
                  0, //number
                  0, //koudoumode(0:down_←,1:up_→)
                  200, //stoptime
                  100);//koudoutime-----------------------------reset:stop[]
        ey[0]=koudouy[0];
        zako(ex[0],ey[0]);   
        kougeki1( ex[0]     , //ex
               ey[0], //ey
               0, //etcount
               5, //speed
               0, //kakudo
               300, //time
               0, //start
               10, //end
               4, //kazu
               150);//kankaku
        edamage(ex[0],ey[0],0,0);
      }
      if(elife[1]>=4)
        elife[1]=10;
      else if(850<=koudoux[1])
      {
        ex[1]=koudoux[1];
        zako(ex[1],125);
        koudoux[1]=koudoux[1]-2;
      }
      else
      {
        koudou1( 250        , //ue_left
                 125 , //sita_right
                  1, //number
                  1, //koudoumode(0:down_←,1:up_→)
                  200, //stoptime
                  100);//koudoutime-----------------------------reset:stop[]
        ey[1]=koudouy[1];
        zako(ex[1],ey[1]);   
        kougeki1( ex[1]     , //ex
               ey[1], //ey
               1, //etcount
               5, //speed
               0, //kakudo
               300, //time
               11, //start
               20, //end
               4, //kazu
               150);//kankaku
        edamage(ex[1],ey[1],0,1);
      }
      if(900<=koudoux[2])
      {
        ex[2]=koudoux[2];
        ey[2]=height/2;
        zako(ex[2],ey[2]);
        koudoux[2]=koudoux[2]-2;
      }
      else if(elife[2]<=4)
      {
        zako(ex[2],ey[2]);   
        kougekihajou(  ex[2]    , //ex
              ey[2] , //ey
              2 , //number
              5 , //speed
              60 , //kakuhani
              100 , //time
              21 , //start
              50 , //end
              0 , //kazu
               6, //hajoukazu
               0);//kankaku  ----------------------------reset:etc[number]
        edamage(ex[2],ey[2],0,2);
      }
      else
        elife[2]=10;
      if((temptime+800)<=frameCount)
      {
        if(elife[3]>=4)
          elife[3]=10;
        else if(820<=koudoux[3])
        {
        koudoux[3]=koudoux[3]-2;
        ex[3]=koudoux[3];
        zako(ex[3],475);
        }
        else
        {
        koudou1( 475        , //ue_left
                 150 , //sita_right
                  3, //number
                  0, //koudoumode(0:down_←,1:up_→)
                  150, //stoptime
                  30);//koudoutime-----------------------------reset:stop[]
        ey[3]=koudouy[3];
        zako(ex[3],ey[3]);   
        kougeki1( ex[3]     , //ex
               ey[3], //ey
               3, //etcount
               9, //speed
               0, //kakudo
               100, //time
               51, //start
               70, //end
               4, //kazu
               5);//kankaku
        edamage(ex[3],ey[3],0,3);
        }
      }
      if((elife[0]==10)&&(elife[1]==10)&&(elife[2]==10)&&(elife[3]==10))
      {
        faze++;
        for(n=0;n<=3;n++)
        {
          elife[n]=0;
          etc[n]=0;
          stop[n]=0;
          koudoux[n]=1090;
        }
      }
    }
    if(faze==5)
    {
      //-----------------------reza
      if(elife[2]>=4)
      {
        rezazako(ex[0],ey[0]);
        ex[0]=ex[0]+4;
        ey[0]=ey[0]-2;
      }
      else if(850<=koudoux[0])
      {
        ex[0]=koudoux[0];
        rezazako(ex[0],475);
        koudoux[0]=koudoux[0]-2;
      }
      else
      {
        koudou1( 350        , //ue_left
                 475 , //sita_right
                  0, //number
                  1, //koudoumode(0:down_←,1:up_→)
                  200, //stoptime
                  100);//koudoutime-----------------------------reset:stop[]
        ey[0]=koudouy[0];
        rezazako(ex[0],ey[0]);   
        kougekireezayoko(ex[0],ey[0],0);
        edamage(ex[0],ey[0],0,0);
      }
      if(elife[2]>=4)
      {
        rezazako(ex[1],ey[1]);
        ex[1]=ex[1]+4;
        ey[1]=ey[1]-2;
      }
      else if(850<=koudoux[1])
      {
        ex[1]=koudoux[1];
        rezazako(ex[1],125);
        koudoux[1]=koudoux[1]-2;
      }
      else
      {
        koudou1( 125        , //ue_left
                 250 , //sita_right
                  1, //number
                  0, //koudoumode(0:down_←,1:up_→)
                  200, //stoptime
                  100);//koudoutime-----------------------------reset:stop[]
        ey[1]=koudouy[1];
        rezazako(ex[1],ey[1]);   
        kougekireezayoko(ex[1],ey[1],1);
        edamage(ex[1],ey[1],0,1);
      }
      
      //-------------------zako
      if(elife[2]>=4)
        elife[2]=10;
      else if(900<=koudoux[2])
      {
        ex[2]=koudoux[2];
        zako(ex[2],200);
        koudoux[2]=koudoux[2]-2;
      }
      else
      {
        koudou1( 300        , //ue_left
                 200 , //sita_right
                  2, //number
                  1, //koudoumode(0:down_←,1:up_→)
                  200, //stoptime
                  50);//koudoutime-----------------------------reset:stop[]
        ey[2]=koudouy[2];
        zako(ex[2],ey[2]);   
        kougeki1( ex[2]     , //ex
               ey[2], //ey
               2, //etcount
               5, //speed
               0, //kakudo
               100, //time
               0, //start
               20, //end
               4, //kazu
               5);//kankaku
        edamage(ex[2],ey[2],0,2);
      }
      if((1090<=ex[0])&&(elife[2]==10))
      {
        faze++;
        ix=0;
        for(n=0;n<=1;n++)
        {
          reza[n]=0;
          rezacount[n]=0;
          stop[n]=0;
          koudoux[n]=1090;
         }
         elife[2]=0;
         etc[2]=0;
         stop[2]=0;
         koudoux[2]=1090;
         temptime=0;
      }
    }  
    if(faze==6)
    {
      
      //----------------------------------------------------item
      for(n=0;n<5;n++)
      itemcooltime[n]=random(500,900);
      if((itemcount==0)&&(itemcooltime[0]<=itemtime))
      {
        if(ix<=1100)
        {
          itemjuu(1090-ix,pey[0],2);
          ix=ix+3;
        }
        else
        {
          itemcount++;
          ix=0;
          itemtime=0;
        }
      }
      else if((itemcount==1)&&(itemcooltime[1]<=itemtime))
      {
        if(ix<=1100)
        {
          itemdebafu(1090-ix,pey[1],1);
          ix=ix+5;
        }
        else
        {
          itemcount++;
          ix=0;
          itemtime=0;
        }
      }
      else if((itemcount==2)&&(itemcooltime[2]<=itemtime))
      {
        if(ix<=1100)
        {
          itemjuu(1090-ix,pey[2],0);
          ix=ix+5;
        }
        else
        {
          itemcount++;
          ix=0;
          itemtime=0;
        }
      }
      else if((itemcount==3)&&(itemcooltime[3]<=itemtime))
      {
        if(ix<=1100)
        {
          itemjuu(1090-ix,pey[3],3);
          ix=ix+5;
        }
        else
        {
          itemcount++;
          ix=0;
          itemtime=0;
        }
      }
      else if((itemcount==4)&&(itemcooltime[4]<=itemtime))
      {
        if(ix<=1100)
        {
          itemjuu(1090-ix,pey[4],1);
          ix=ix+5;
        }
        else
        {
          itemcount++;
          ix=0;
          itemtime=0;
        }
      }
      itemtime++;
      //----------------------------------------------reza
      if(sfaze==10)
      {
        rezazako(ex[0],ey[0]);
        ex[0]=ex[0]+4;
        ey[0]=ey[0]-2;
      }
      else if(1000<=koudoux[0])
      {
        ex[0]=koudoux[0];
        rezazako(ex[0],50);
        koudoux[0]=koudoux[0]-2;
      }
      else
      {
        koudou1( 50        , //ue_left
                 475 , //sita_right
                  0, //number
                  0, //koudoumode(0:down_←,1:up_→)
                  200, //stoptime
                  150);//koudoutime-----------------------------reset:stop[]
        ey[0]=koudouy[0];
        rezazako(ex[0],ey[0]);   
        kougekireezayoko(ex[0],ey[0],0);
        edamage(ex[0],ey[0],0,0);
      }
      //------------------------------------------zako
      if((temptime%100==0)&&(zakocount<11))
      {
        za[zakocount]++;
        zakocount++;
      }
      temptime++;
     
      if(za[1]==1)
      zakom(pex[1],pey[1],1);
      if(za[2]==1)
      zakom(pex[2],pey[2],2);
      if(za[3]==1)
      zakom(pex[3],pey[3],3);
      if(za[4]==1)
      zakom(pex[4],pey[4],4);
      if(za[5]==1)
      zakom(pex[5],pey[5],5);
      if(za[6]==1)
      zakom(pex[6],pey[6],6);
      if(za[7]==1)
      zakom(pex[7],pey[7],7);
      if(za[8]==1)
      zakom(pex[8],pey[8],8);
      if(za[9]==1)
      zakom(pex[9],pey[9],9);
      if(za[10]==1)
      zakom(pex[10],pey[10],10);
     
      if((sfaze==10)&&(1090<=ex[0]))
      {
        faze++;
        itemcount=0;
        temptime=frameCount;
        for(n=0;n<21;n++)
        {
          elife[n]=0;
          etc[n]=0;
          koudoux[n]=1090;
        }
        reza[0]=0;
        rezacount[0]=0;
        stop[0]=0;
        etx[0]=1090;
      }
    }
    if(faze==7)
    {
      if(bomcount==0)
      {
        if(((temptime+300)<frameCount)&&(frameCount<(temptime+600)))
        {
          muteki=1;
          ety[0]=height/2;
          if(540<etx[0])
          {
            ellipse(etx[0],ety[0],20,20);
            etx[0]=etx[0]-5;
          }
          else if((etx[0]==540)&&(frameCount%20!=0))
          ellipse(etx[0],ety[0],20,20);
        }
        else if(frameCount==(temptime+600))
        {
          bomcount++;
          etx[0]=0;
          ety[0]=0;
          shotmode=0;
        }
      }
      else if(bomcount==2)
      {
        if(frameCount<=(temptime+600))
        {
          ex[0]=950;
          ey[0]=height/2;
         boss(ex[0],ey[0],0,10);
         bossrezayoko(ex[0],ey[0],0,500);
        }
        else if(frameCount<=(temptime+690))
        {
         boss(ex[0],ey[0],0,10);
         ey[0]--;
        }
        else 
        {
          if(elife[0]<=10)
          {
           koudou1( 210        , //ue_left
                 390 , //sita_right
                  0, //number
                  0, //koudoumode(0:down_←,1:up_→)
                  200, //stoptime
                  200);//koudoutime-----------------------------reset:stop[]
          ey[0]=koudouy[0];
          boss(ex[0],ey[0],0,10);
          kougekinami(      
                       ex[0], //ex
                        ey[0], //ey
                            0, //number
                           7, //speed
                           17, //kakuspeed
                           80, //kakuhani
                          15, //time
                            0, //start
                           60, //end
                            0, //kazu
                            0); //kankaku
          if(bossrezaswitch==0)
          {
            bossrezacount=0;
            reza[0]=0;
            rezacount[0]=0;
            bossrezaswitch++;
          }
          else if(bossrezaswitch==1)
          {
          bossrezamode=0;
          bossrezayokol(ex[0],ey[0],0,300);
          }
          edamage(ex[0],ey[0],1,0);
          if(850<=koudoux[1])
             {
               koudoux[1]=koudoux[1]-2;
               ex[1]=koudoux[1];
               zako(ex[1],475);
             }
             else if(elife[1]<=4)
             {
                koudou1( 475        , //ue_left
                 350 , //sita_right
                  1, //number
                  0, //koudoumode(0:down_←,1:up_→)
                  200, //stoptime
                  100);//koudoutime-----------------------------reset:stop[]
               ey[1]=koudouy[1];
               zako(ex[1],ey[1]);   
               kougekihajou(      
               ex[1], //ex
               ey[1], //ey
               1, //number
               5, //speed
               60, //kakuhani
               250, //time
               61, //start
               120, //end
               2, //kazu
               5, //hajoukazu
               50);//kankaku 
               edamage(ex[1],ey[1],0,1);
             }
            if(850<=koudoux[2])
            {
              ex[2]=koudoux[2];
              zako(ex[2],125);
              koudoux[2]=koudoux[2]-2;
            }
            else if(elife[2]<=4)
            {
              koudou1( 250        , //ue_left
                 125 , //sita_right
                  2, //number
                  1, //koudoumode(0:down_←,1:up_→)
                  200, //stoptime
                  100);//koudoutime-----------------------------reset:stop[]
              ey[2]=koudouy[2];
              zako(ex[2],ey[2]);   
              kougekihajou(      
              ex[2], //ex
              ey[2], //ey
              2, //number
              5, //speed
              60, //kakuhani
              400, //time
              121, //start
              180, //end
              4, //kazu
              5, //hajoukazu
              60);//kankaku 
             edamage(ex[2],ey[2],0,2);
           }
          }
          else
           faze=8;
        }
      if(bossrezamode==1)
      {
        for(n=0;n<30;n++)
        {
          if(((ex[0]-82)<=ktx[n])&&(ktx[n]<=(ex[0]-58))&&((ey[0]-62)<=kty[n])&&(kty[n]<=(ey[0]+62)))
           kty[n]=-30;
          if(((ex[0]-98)<=kx)&&(kx<=(ex[0]-42))&&((ey[0]-75)<=ky)&&(ky<=(ey[0]+75)))
          klife++;
        }
      }
    } 
   }
        
  //----------------------------------------kitai damage
    for(n=0;n<100;n++)
    {
      if(((kx-26)<=etx[n])&&(etx[n]<=(kx+26))&&((ky-26)<=ety[n])&&(ety[n]<=(ky+26)))
      {
        klife++;
        if(muteki==0)
        etx[n]=-10;
        else
        klife=klife+4;
      }
    }
  
  //---------------------------------------shyoutotu
    if(shotmode==3)
    {
      for(n=0;n<100;n++)
      {
        if(((ky-20+shotrezay/20)<=ety[n])&&(ety[n]<=(ky+20-shotrezay/20))&&((kx+30)<=etx[n])&&(etx[n]<=(kx+shotreza)))
          if(muteki==0)
          etx[n]=-50;
          else
          shotreza=etx[n];
      }
      for(n=0;n<10;n++)
      {
        if(((ky-20+shotrezay/20)<=ey[n])&&(ey[n]<=(ky+20-shotrezay/20))&&((kx+30)<=ex[n])&&(ex[n]<=(kx+shotreza)))
          elife[n]=elife[n]+2;
      }
    }
    else
    {
      for(n=0;n<30;n++)
      {
        for(m=0;m<100;m++)
        {
          if(shotmode==0)
          {
            if(((ktx[n]-17)<=etx[m])&&(etx[m]<=(ktx[n]+17))&&((kty[n]-17)<=ety[m])&&(ety[m]<=(kty[n]+17)))
            {
              if(muteki==0)
              {
                 kty[n]=-30;
                 etx[m]=-50;
              }
              else
                 kty[n]=-30;  
            }
          }
          else if(shotmode==1)
          {
            if(((ktx[n]-14)<=etx[m])&&(etx[m]<=(ktx[n]+14))&&((kty[n]-14)<=ety[m])&&(ety[m]<=(kty[n]+14)))
            {
              if(muteki==0)
              {
                kty[n]=-30;
                shyoutotu[m]++;
                if(5<=shyoutotu[m])
                  etx[m]=-50;
              }
              else
                kty[n]=-30;
            }
          }
          else if(shotmode==2)
          {
            if(((ktx[n]-26)<=etx[m])&&(etx[m]<=(ktx[n]+26))&&((kty[n]-26)<=ety[m])&&(ety[m]<=(kty[n]+26)))
            {
              if(muteki==0)
              {
                etx[m]=-50;
                shyoutotu[n]++;
                if(4<=shyoutotu[n])
                  kty[n]=-30;
              }
              else
               kty[n]=-30;
             }
           }
         }  
       }
     }
   }
  image(billmae1,billmaex,0);
  image(billmae2,billmaex+2134,0);
  billmaex=billmaex-2;
  if(billmaex==-2134)
  billmaex=0;
  if(faze==7)
  {
    if(bomcount==1)
    {
      if(bom<1300)
      {
      ellipse(540,height/2,20+bom,20+bom);
      bom=bom+50;
      }
      else if(bom==1300)
      {
        ellipse(540,height/2,2000,2000);
        klife=4;
        temptime=frameCount;
        bom++;
        bomcount++;
      }
      
    }
    else if(bomcount==2)
    {
      if(bom<1400)
      {
        bom++;
        ellipse(540,height/2,2000,2000);
      }
      else if(bomcolor<100)
      {
      push();
      bomcolor=bomcolor+0.5;
      colorMode(HSB,360,100,100,100);
      fill(0,0,100,100-bomcolor);
      ellipse(540,height/2,2000,2000);
      pop();
      }
    }
  }
  if(klife<5)
  {
    rectMode(CORNERS);
    rect(65,575,(5-klife)*100,585);
  }
}

void koudou1(float ue,float sita,int number,int koudoumode,int stoptime,float koudoutime)
{
  if(stop[number]<=stoptime)
  {
    if(koudoumode==0)
      koudouy[number]=ue;
    else 
      koudouy[number]=sita;
  }
  else if((stop[number]<=(stoptime+koudoutime))||(((2*stoptime+koudoutime)<=stop[number])&&(stop[number]<=(2*stoptime+2*koudoutime))))
  {
      if((koudouy[number])==ue)
      {
         kou[number]=1;
        koudouy[number]=koudouy[number]+kou[number]*((sita-ue)/koudoutime);
      }
      else if((koudouy[number])==sita)
      {
        kou[number]=-1;
        koudouy[number]=koudouy[number]+kou[number]*((sita-ue)/koudoutime);
      }
      else
        koudouy[number]=koudouy[number]+kou[number]*((sita-ue)/koudoutime);
  }
  else if(stop[number]<=(2*stoptime+koudoutime))
  {
    if(koudoumode==0)
      koudouy[number]=sita;
    else 
      koudouy[number]=ue;
  }
  else if((2*stoptime+2*koudoutime)<stop[number])
    stop[number]=0;
  stop[number]++;
}
  
void zakom(float pex,float pey,int enumber)
{
  if(elife[enumber]==4)
  {
        sfaze++;
        za[enumber]++;
      }
  else if(pex<=koudoux[enumber])
  {
        ex[enumber]=koudoux[enumber];
        ey[enumber]=(int)pey;
        zako(ex[enumber],ey[enumber]);
        koudoux[enumber]=koudoux[enumber]-2;
      }
  else if(elife[enumber]<3)
  {
        zako(ex[enumber],ey[enumber]);   
        kougeki1( ex[enumber]     , //ex
               ey[enumber], //ey
               enumber, //etcount
              (int) zakospeed[enumber], //speed
               0, //kakudo
               150, //time
               0+enumber*3, //start
               2+enumber*3, //end
               1, //kazu
               0);//kankaku
        edamage(ex[enumber],ey[enumber],0,enumber);
      }
}
  
void kitai()
{
  push();
  imageMode(CENTER);
  image(chara,kx,ky,50,50);
  pop();
  if(5<=klife)
  {
    faze=-1;
    temptime=frameCount;
  }
}

void boss(float ex,float ey,int enumber,int life)
{
 push();
  imageMode(CENTER);
  image(boss,ex,ey,100,100);
  rectMode(CORNERS);
  if(bossrezamode==1)
  rect(ex-73,ey-50,ex-67,ey+50);
  rect(65,20,(life-elife[enumber])*100,30);
  pop();
}

void zako(float ex,float ey)
{
  push();
  imageMode(CENTER);
  image(enemyzako,ex,ey,34,34);
  pop();
  if(((ex-32)<=kx)&&(kx<=(ex+32))&&((ey-32)<=ky)&&(ky<=(ey+32)))
    klife++;
}

void rezazako(float ex,float ey)
{
  push();
  imageMode(CENTER);
  image(enemyreza,ex,ey,34,34);
  pop();
  if(((ex-32)<=kx)&&(kx<=(ex+32))&&((ey-32)<=ky)&&(ky<=(ey+32)))
    klife++;
}

void edamage(float ex,float ey,int type,int enumber)
{
  if(type==0)
    siz=14;
  else if(type==1)
    siz=50;
  if(shotmode==1)
  {
    siz=siz+3;
    shotdame=0.2;
  }
  else
    shotdame=1;
  for(n=0;n<30;n++)
  {
    if(shotmode==2)
    {
      if(((ex-siz-18)<=ktx[n])&&(ktx[n]<=(ex+siz+18))&&((ey-siz-18)<=kty[n])&&(kty[n]<=(ey+siz+18)))
      {
        kty[n]=-30;
        elife[enumber]=elife[enumber]+4;
      }
    }
    else if(shotmode!=2)
    {
      if(((ex-siz-9)<=ktx[n])&&(ktx[n]<=(ex+siz+9))&&((ey-siz-9)<=kty[n])&&(kty[n]<=(ey+siz+9)))
      {
        kty[n]=-30;
        elife[enumber]=elife[enumber]+shotdame;
      }
    }
  }
}

void mousePressed()
{
  if(1<faze)
  {
    if(((frameCount-shottime)>25)&&(shotmode==0))
    {
      kty[ktc1]=ky;
      ktx[ktc1]=kx;
      shyoutotu[ktc1]=0;
      ktc1++;
      shottime=frameCount;
    }
    else if(((frameCount-shottime)>50)&&(shotmode==2))
    {
      kty[ktc1]=ky;
      ktx[ktc1]=kx;
      shyoutotu[ktc1]=0;
      ktc1++;
      shottime=frameCount;
    }
  }
}
  
void shot(float kx,float ky)
{
  if(shotmode==1)//-------------------------------------gatoringu
  {
    if((mousePressed==true)&&(frameCount%5==0))
    {
      kty[ktc1]=ky;
      ktx[ktc1]=kx;
      shyoutotu[ktc1]=0;
      ktc1++;
    }
    if((ktc1>=0)&&(ktc1<30))
    {
      for(n=0;n<30;n++)
      {
        ktx[n]=ktx[n]+8;
        noStroke();
        ellipse(ktx[n],kty[n],12,12);
      }
    }else
      ktc1=0;
  }
  else if(shotmode==2)//---------------------------canon
  {
    if((ktc1>=0)&&(ktc1<10))
    {
      for(n=0;n<10;n++)
      {
        ktx[n]=ktx[n]+5;
        noStroke();
        ellipse(ktx[n],kty[n],36,36);
      }
    }else
      ktc1=0;
  }
  else if(shotmode==3)//--------------------------reza
  {
    if((mousePressed==true)&&(shotreza<1200)&&((frameCount-shottime)>100))
    {
      noStroke();
      easing=0.006;
      if(shotreza<40)
      {
        ellipse(kx+shotreza,ky,20,20);
        shotreza=shotreza+2;
      }
      else if(shotreza==40)
      {
        if(shotrezacount<20)
        {
          ellipse(kx+40,ky,20,20);
          shotrezacount++;
        }
        else if(shotrezacount<50)
        {
           ellipse(kx+40,ky,20+(shotrezacount-20)/3,20+(shotrezacount-20)/3);
           shotrezacount++;
        }
        else if(shotrezacount<60)
        {
           ellipse(kx+40,ky,30-(shotrezacount-50),30-(shotrezacount-50));
           shotrezacount++;
        }
        else
          shotreza++;
      }
      else if(shotreza==41)
      {
        if(shotrezacount<=70)
        {
          ellipse(kx+40,ky,20,20);
          shotrezacount++;
        }
        else
          shotreza++;
      }
      else if(shotreza<=1100)
      {
        ellipse(kx+40,ky,20,20);
        rectMode(CORNERS);
        rect(kx+shotreza,ky-5,kx+40,ky+5);
        shotreza=shotreza+100;
      }
      else
      {
        ellipse(kx+40,ky,20,20);
        rectMode(CORNERS);
        rect(kx+shotreza,ky-5,kx+40,ky+5);
        shotreza++;
      }
      shotrezay=0;
    }
    else
    {
      if((40<shotreza)&&(shotrezay<=40))
      {
        ellipse(kx+40,ky,20,20);
        rectMode(CORNERS);
        rect(kx+shotreza,ky-5+shotrezay/8,kx+40,ky+5-shotrezay/8);
        shotrezay++;
        shottime=frameCount;
      }
      else if((shotrezay==0)||(40<shotrezay))
      {
        shotreza=0;
        shotrezacount=0;
        easing=0.08;
      }
    }
  }
  else if(shotmode==0)//---------------------------tuujyou
  {
    if((ktc1>=0)&&(ktc1<10))
    {
      for(n=0;n<10;n++)
      {
        ktx[n]=ktx[n]+5;
        noStroke();
        ellipse(ktx[n],kty[n],18,18);
      }
    }else
      ktc1=0;
  }
}
  
void kougeki1(float ex,float ey,int etcount,int speed,int kakudo,int time,int start,int end,int kazu,int kankaku)
{
  
  for(m=0;m<=kazu;m++)
  {
    if((frameCount%time)==m*kankaku)
    {
      etx[etc[etcount]+start]=ex;
      ety[etc[etcount]+start]=ey;
      etc[etcount]++;
    }
  }
  if(etc[etcount]<=end)
  {
      for(n=start;n<=end;n++)
      {
        etx[n]=etx[n]-speed*cos(radians(kakudo));
        ety[n]=ety[n]+speed*sin(radians(kakudo));
        noStroke();
        ellipse(etx[n],ety[n],16,16);
      }
  }
  else
    etc[etcount]=0;
}

void kougekinami(float ex,float ey,int etcount,int speed,int kakuspeed,int kakuhani,int time,int start,int end,int kazu,int kankaku)
{
  nami2=0;
  for(m=0;m<=kazu;m++)
  {
    if((frameCount%time)==m*kankaku)
    {
      etx[etc[etcount]+start]=ex;
      ety[etc[etcount]+start]=ey;
      etc[etcount]++;
    }
  }
  if(etc[etcount]<=end)
  {
    for(n=start;n<=end;n++)
    {
      if((kakucount[nami2]-kakuhani)==-kakuhani)
        nami3=1;
      else if((kakucount[nami2]-kakuhani)==kakuhani)
        nami3=-1;
      nami2=nami2+nami3*kakuspeed;
      if(nami2<0)
        nami2=0;
      else if(nami2>kakuhani*2)
        nami2=kakuhani*2;
      etx[n]=etx[n]-speed*cos(radians(kakucount[nami2]-kakuhani));
      ety[n]=ety[n]+speed*sin(radians(kakucount[nami2]-kakuhani));
      noStroke();
      ellipse(etx[n],ety[n],16,16);
    }
    
  }else
    etc[etcount]=0;
}

void kougekihajou(float ex,float ey,int etcount,int speed,int kakuhani,int time,int start,int end,int kazu,int hajoukazu,int kankaku)
{
  for(m=0;m<=kazu;m++)
  {
    if((frameCount%time)==m*kankaku)
    {
      for(n=0;n<hajoukazu;n++)
      {
        etx[etc[etcount]+start]=ex;
        ety[etc[etcount]+start]=ey;
        etc[etcount]++;
      }
    }
  }
  if(etc[etcount]<=end)
  {
    for(n=start;n<=end;n=n+hajoukazu)
    {
      for(m=0;m<hajoukazu;m++)
      {
        etx[n+m]=etx[n+m]-speed*cos(radians(m*(kakuhani*2/hajoukazu)-kakuhani));
        ety[n+m]=ety[n+m]+speed*sin(radians(m*(kakuhani*2/hajoukazu)-kakuhani));
        noStroke();
        ellipse(etx[n+m],ety[n+m],16,16);
      }
    }
  }else
    etc[etcount]=0;
}

void kougekireezayoko(float ex,float ey,int number)
{
  noStroke();
  if(reza[number]<30)
  {
    ellipse(ex-reza[number],ey,20,20);
    reza[number]=reza[number]+2;
  }
  else if(reza[number]==30)
  {
    if(rezacount[number]<50)
    {
      ellipse(ex-30,ey,20,20);
      rezacount[number]++;
    }
    else if(rezacount[number]<80)
    {
      ellipse(ex-30,ey,20+(rezacount[number]-50)/3,20+(rezacount[number]-50)/3);
      rezacount[number]++;
    }
    else if(rezacount[number]<90)
    {
      ellipse(ex-30,ey,30-(rezacount[number]-80),30-(rezacount[number]-80));
      rezacount[number]++;
    }
    else
      reza[number]++;
  }
  else if(reza[number]==31)
  {
    if(rezacount[number]<=100)
    {
      ellipse(ex-30,ey,20,20);
      rezacount[number]++;
    }
    else
      reza[number]++;
  }
  else if(reza[number]<=1000)
  {
    ellipse(ex-30,ey,20,20);
    rectMode(CORNERS);
    rect(ex-reza[number],ey-5,ex-30,ey+5);
    reza[number]=reza[number]+100;
  }
  else
  {
    ellipse(ex-30,ey,20,20);
    rectMode(CORNERS);
    rect(ex-reza[number],ey-5,ex-30,ey+5);
  }
  
  //-----------------------------------------------------kitaidamage
  if(((ey-20)<=ky)&&(ky<=(ey+20))&&((ex-reza[number])<=kx)&&(kx<=ex))
    klife=klife+2;
  if(((ey-25)<=ky)&&(ky<=(ey+25))&&((ex-25)<=kx)&&((ex+25)<=kx))
     klife=klife+4;
}

void bossrezayoko(float ex,float ey,int number,int endreza)
{
  push();
  noStroke();
  rectMode(CENTER);
  if(reza[number]<70)
  {
    rect(ex-reza[number],ey,6,10);
    reza[number]=reza[number]+5;
  }
  else if(reza[number]==70)
  {
    if(rezacount[number]<50)
    {
      rect(ex-70,ey,6,10);
      rezacount[number]++;
    }
    else if(rezacount[number]<150)
    {
      rect(ex-70,ey+(rezacount[number]-50)*2+10,6,10);
      rect(ex-70,ey-(rezacount[number]-50)*2-10,6,10);
      rect(ex-70,ey,2,(rezacount[number]-50)*4);
      rezacount[number]++;
    }
    else if(rezacount[number]<200)
    {
      rect(ex-70,ey+210,6,10);
      rect(ex-70,ey-210,6,10);
      if(frameCount%3!=0)
      rect(ex-70,ey,2,400);
      rezacount[number]++;
    }
    else
      reza[number]++;
  }
  else if(reza[number]<=1000)
  {
    rect(ex-70,ey+210,6,10);
    rect(ex-70,ey-210,6,10);
    rectMode(CORNERS);
    rect(ex-reza[number],ey-200,ex-70,ey+200);
    reza[number]=reza[number]+100;
  }
  else if(endreza>=bossrezacount)
  {
    rect(ex-70,ey+210,6,10);
    rect(ex-70,ey-210,6,10);
    rectMode(CORNERS);
    rect(ex-reza[number],ey-200,ex-70,ey+200);
    //-----------------------------------------------------kitaidamage
  if(((ey-220)<=ky)&&(ky<=(ey+220))&&((ex-reza[number])<=kx)&&(kx<=ex))
    klife=klife+2;
  if(((ey-25)<=ky)&&(ky<=(ey+25))&&((ex-25)<=kx)&&((ex+25)<=kx))
     klife=klife+4;
  }
  else if((endreza<bossrezacount)&&(bossrezacount<=(endreza+20)))
  {
    rect(ex-70,ey+210-(bossrezacount-endreza)*6,6,10);
    rect(ex-70,ey-210+(bossrezacount-endreza)*6,6,10);
    rectMode(CORNERS);
    rect(ex-reza[number],ey-200+(bossrezacount-endreza)*10,ex-70,ey+200-(bossrezacount-endreza)*10);
    //-----------------------------------------------------kitaidamage
  if(((ey-200+(bossrezacount-endreza)*10)<=ky)&&(ky<=(ey+200-(bossrezacount-endreza)*10))&&((ex-reza[number])<=kx)&&(kx<=ex))
    klife=klife+2;
  if(((ey-25)<=ky)&&(ky<=(ey+25))&&((ex-25)<=kx)&&((ex+25)<=kx))
     klife=klife+4;
  }
  else
  {
   rect(ex-70,ey,6,100);
   bossrezamode=1;
  }
  bossrezacount++;
  pop();
}

void bossrezayokol(float ex,float ey,int number,int endreza)
{
  push();
  noStroke();
  rectMode(CENTER);
  if(reza[number]==0)
  {
    if(rezacount[number]<40)
    {
      rezacount[number]++;
      push();
      rectMode(CORNERS);
      rect(ex-73,ey-50,ex-67,ey-rezacount[number]);
      rect(ex-73,ey+rezacount[number],ex-67,ey+50);
      pop();
    }
    if(rezacount[number]<90)
    {
      rezacount[number]++;
      push();
      rectMode(CORNERS);
      rect(ex-73,ey-50-(rezacount[number]-40)*3-20,ex-67,ey-50-(rezacount[number]-40)*3-10);
      rect(ex-73,ey+50+(rezacount[number]-40)*3+20,ex-67,ey+50+(rezacount[number]-40)*3+20);
      rect(ex-71,ey-50-(rezacount[number]-40)*3,ex-69,ey+50+(rezacount[number]-40)*3);
      pop();
    }
    else if(rezacount[number]<290)
    {
      rect(ex-70,ey+210,6,10);
      rect(ex-70,ey-210,6,10);
      if(frameCount%3!=0)
      rect(ex-70,ey,2,400);
      rezacount[number]++;
    }
    else
      reza[number]=70;
  }
  else if(reza[number]<=1000)
  {
    rect(ex-70,ey+210,6,10);
    rect(ex-70,ey-210,6,10);
    rectMode(CORNERS);
    rect(ex-reza[number],ey-200,ex-70,ey+200);
    reza[number]=reza[number]+100;
  }
  else if(endreza>=bossrezacount)
  {
    rect(ex-70,ey+210,6,10);
    rect(ex-70,ey-210,6,10);
    rectMode(CORNERS);
    rect(ex-reza[number],ey-200,ex-70,ey+200);
    //-----------------------------------------------------kitaidamage
  if(((ey-220)<=ky)&&(ky<=(ey+220))&&((ex-reza[number])<=kx)&&(kx<=ex))
    klife=klife+2;
  if(((ey-25)<=ky)&&(ky<=(ey+25))&&((ex-25)<=kx)&&((ex+25)<=kx))
     klife=klife+4;
  }
  else if((endreza<bossrezacount)&&(bossrezacount<=(endreza+20)))
  {
    rect(ex-70,ey+210-(bossrezacount-endreza)*6,6,10);
    rect(ex-70,ey-210+(bossrezacount-endreza)*6,6,10);
    rectMode(CORNERS);
    rect(ex-reza[number],ey-200+(bossrezacount-endreza)*10,ex-70,ey+200-(bossrezacount-endreza)*10);
    //-----------------------------------------------------kitaidamage
  if(((ey-200+(bossrezacount-endreza)*10)<=ky)&&(ky<=(ey+200-(bossrezacount-endreza)*10))&&((ex-reza[number])<=kx)&&(kx<=ex))
    klife=klife+2;
  if(((ey-25)<=ky)&&(ky<=(ey+25))&&((ex-25)<=kx)&&((ex+25)<=kx))
     klife=klife+4;
  }
  else if(bossrezacount<=(endreza+120))
  {
   rect(ex-70,ey,6,100);
   bossrezamode=1;
   bossrezaswitch=0;
  }
  bossrezacount++;
  pop();
}

void kougekireezatate(float ex,float ey,int number)
{
  noStroke();
  if(reza[number]<30)
  {
    ellipse(ex,ey+reza[number],20,20);
    reza[number]=reza[number]+1;
  }
  else if(reza[number]==30)
  {
    if(rezacount[number]<50)
    {
      ellipse(ex,ey+30,20,20);
      rezacount[number]++;
    }
    else if(rezacount[number]<80)
    {
      ellipse(ex,ey+30,20+(rezacount[number]-50)/3,20+(rezacount[number]-50)/3);
      rezacount[number]++;
    }
    else if(rezacount[number]<90)
    {
      ellipse(ex,ey+30,30-(rezacount[number]-80),30-(rezacount[number]-80));
      rezacount[number]++;
    }
    else
      reza[number]++;
  }
  else if(reza[number]==31)
  {
    if(rezacount[number]<=100)
    {
      ellipse(ex,ey+30,20,20);
      rezacount[number]++;
    }
    else
      reza[number]++;
  }
  else if(reza[number]<=1000)
  {
    ellipse(ex,ey+30,20,20);
    rectMode(CORNERS);
    rect(ex-5,ey+30,ex+5,ey+reza[number]);
    reza[number]=reza[number]+100;
  }
  else
  {
    ellipse(ex,ey+30,20,20);
    rectMode(CORNERS);
    rect(ex-5,ey+30,ex+5,ey+reza[number]);
  }
  
  //----------------------------------------------------------------kitaidamage
  if(((ex-20)<=kx)&&(kx<=(ex+20))&&((ey+reza[number])>=ky)&&(ky>=ey))
    klife=klife+2;
  if(((ex-25)<=kx)&&(kx<=(ex+25))&&((ey-25)<=ky)&&((ey+25)<=ky))
     klife=klife+4;
}

void itemjuu(int x,float y,int mode)
{
  if(shotmode!=mode)
  {
    push();
    imageMode(CENTER);
    if(mode==0)
    image(icontuujyou,x,y,20,20);
    if(mode==1)
    image(icongatoring,x,y,20,20);
    if(mode==2)
    image(iconcanon,x,y,20,20);
    if(mode==3)
    image(iconrazer,x,y,20,20);
    pop();
    if(((x-28)<=kx)&&(kx<=(x+28))&&((y-28)<=ky)&&(ky<=(y+28)))
     shotmode=mode;
  }
}

void itemdebafu(int x,float y,int item)
{
 
  if(get==0)
  {
     push();
    imageMode(CENTER);
    if(item==0)
    {
      image(icondebafu,x,y,20,20);
       pop();
      if(((x-28)<=kx)&&(kx<=(x+28))&&((y-28)<=ky)&&(ky<=(y+28)))
      {
        easing=0.01;
        get=1;
      }
    }
    else if(item==1)
      {
        image(iconheal,x,y,20,20);
         pop();
        if(((x-28)<=kx)&&(kx<=(x+28))&&((y-28)<=ky)&&(ky<=(y+28)))
        {
          klife=klife-3;
          get=1;
        }
      }
  }
 
}
