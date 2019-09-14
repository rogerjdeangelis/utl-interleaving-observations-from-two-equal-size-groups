Nice examples of interleaving observations                                                                           
                                                                                                                     
Problem:                                                                                                             
   Put married couples in consecutive observations                                                                   
                                                                                                                     
     Three Solutions                                                                                                 
                                                                                                                     
         a. two set statements                                                                                       
            KSharpe                                                                                                  
            https://tinyurl.com/y5qr7euo                                                                             
                                                                                                                     
         b. hash1 (interesting hash will not add duplicate keys so                                                   
                    it alternates "F/M" for each record in the firs "F" group?)                                      
            Novinosrin                                                                                               
            https://communities.sas.com/t5/user/viewprofilepage/user-id/138205                                       
                                                                                                                     
         c. Compile time group size                                                                                  
            Anandkvn                                                                                                 
            https://communities.sas.com/t5/user/viewprofilepage/user-id/265860                                       
                                                                                                                     
                                                                                                                     
KSharpe                                                                                                              
https://communities.sas.com/t5/user/viewprofilepage/user-id/18408                                                    
                                                                                                                     
github                                                                                                               
https://tinyurl.com/y5qr7euo                                                                                         
https://communities.sas.com/t5/SAS-Programming/How-to-print-variable-observations-alternatively/m-p/588716           
                                                                                                                     
*_                   _                                                                                               
(_)_ __  _ __  _   _| |_                                                                                             
| | '_ \| '_ \| | | | __|                                                                                            
| | | | | |_) | |_| | |_                                                                                             
|_|_| |_| .__/ \__,_|\__|                                                                                            
        |_|                                                                                                          
;                                                                                                                    
                                                                                                                     
DATA have;                                                                                                           
  INPUT couple $ SEX$;                                                                                               
DATALINES;                                                                                                           
Mary F                                                                                                               
Kate F                                                                                                               
Jane F                                                                                                               
Barb F                                                                                                               
Mike M                                                                                                               
Bart M                                                                                                               
Paul M                                                                                                               
Pete M                                                                                                               
;                                                                                                                    
RUN;                                                                                                                 
                                                                                                                     
*            _               _                                                                                       
  ___  _   _| |_ _ __  _   _| |_                                                                                     
 / _ \| | | | __| '_ \| | | | __|                                                                                    
| (_) | |_| | |_| |_) | |_| | |_                                                                                     
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                    
                |_|                                                                                                  
;                                                                                                                    
                                                                                                                     
Below will work for your sample data but be aware that the SAS data step                                             
will stop as soon as one of the groups doesn't have any further observations                                         
(if the groups are not equal some source observations will not be written to target).                                
                                                                                                                     
                                                                                                                     
 WORK.WANT total obs=8                                                                                               
                                                                                                                     
   COUPLE    SEX                                                                                                     
                                                                                                                     
    Mary      F                                                                                                      
    Mike      M                                                                                                      
                                                                                                                     
    Kate      F                                                                                                      
    Bart      M                                                                                                      
                                                                                                                     
    Jane      F                                                                                                      
    Paul      M                                                                                                      
                                                                                                                     
    Barb      F                                                                                                      
    Pete      M                                                                                                      
                                                                                                                     
*          _       _   _                                                                                             
 ___  ___ | |_   _| |_(_) ___  _ __  ___                                                                             
/ __|/ _ \| | | | | __| |/ _ \| '_ \/ __|                                                                            
\__ \ (_) | | |_| | |_| | (_) | | | \__ \                                                                            
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/                                                                            
                                                                                                                     
;                                                                                                                    
*           _                            _                                                                           
  __ _     | |___      _____    ___  ___| |_ ___                                                                     
 / _` |    | __\ \ /\ / / _ \  / __|/ _ \ __/ __|                                                                    
| (_| |_   | |_ \ V  V / (_) | \__ \  __/ |_\__ \                                                                    
 \__,_(_)   \__| \_/\_/ \___/  |___/\___|\__|___/                                                                    
                                                                                                                     
;                                                                                                                    
                                                                                                                     
Below will work for your sample data but be aware that the SAS                                                       
data step will stop as soon as one of the groups doesn't have                                                        
any further observations (=if the groups are not                                                                     
equal some source observations will not be written to target).                                                       
                                                                                                                     
data want;                                                                                                           
  set have(where=(sex='F'));                                                                                         
  output;                                                                                                            
  set have(where=(sex='M'));                                                                                         
  output;                                                                                                            
run;                                                                                                                 
                                                                                                                     
*_         _               _     _                                                                                   
| |__     | |__   __ _ ___| |__ / |                                                                                  
| '_ \    | '_ \ / _` / __| '_ \| |                                                                                  
| |_) |   | | | | (_| \__ \ | | | |                                                                                  
|_.__(_)  |_| |_|\__,_|___/_| |_|_|                                                                                  
                                                                                                                     
;                                                                                                                    
                                                                                                                     
data _null_;                                                                                                         
if _n_=1 then do;                                                                                                    
   dcl hash H (ordered: "A",multidata:'y') ;                                                                         
   h.definekey  ("_n_") ;                                                                                            
   h.definedata ("sex","couple") ;                                                                                   
   h.definedone () ;                                                                                                 
end;                                                                                                                 
do _n_=1 by 1 until(last.sex);                                                                                       
 set have end=z;                                                                                                     
 by sex;                                                                                                             
 h.add();                                                                                                            
 output;                                                                                                             
end;                                                                                                                 
if z ;                                                                                                               
h.output(dataset:'want');                                                                                            
run;                                                                                                                 
                                                                                                                     
*                                   _ _        _   _                                                                 
  ___      ___ ___  _ __ ___  _ __ (_) | ___  | |_(_)_ __ ___   ___                                                  
 / __|    / __/ _ \| '_ ` _ \| '_ \| | |/ _ \ | __| | '_ ` _ \ / _ \                                                 
| (__ _  | (_| (_) | | | | | | |_) | | |  __/ | |_| | | | | | |  __/                                                 
 \___(_)  \___\___/|_| |_| |_| .__/|_|_|\___|  \__|_|_| |_| |_|\___|                                                 
                             |_|                                                                                     
;                                                                                                                    
                                                                                                                     
data want;                                                                                                           
do _n_=1 to n;                                                                                                       
  p=ifn(_n_=1,1,p+n/2-(n-1)*mod(_n_,2));                                                                             
  set have nobs=n point=p;                                                                                           
  output;                                                                                                            
end;                                                                                                                 
stop;                                                                                                                
run;                                                                                                                 
                                                                                                                     
