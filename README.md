# utl-interleaving-observations-from-two-equal-size-groups
Nice examples of interleaving observations     
    Interleaving observations from two equal size groups                                                                  
                                                                                                                          
     Problem:                                                                                                             
                                                                                                                          
       Put married couples in consecutive observations                                                                    
                                                                                                                          
         Seven Solutions                                                                                                  
                                                                                                                          
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
                                                                                                                          
             d. Paul merge                                                                                                
                Paul Dorfman                                                                                              
                sashole@bellsouth.net                                                                                     
                                                                                                                          
             e. Quentin (unequal groups)                                                                                  
                Quentin McMullen                                                                                          
                qmcmullen.sas@GMAIL.COM                                                                                   
                                                                                                                          
             f. Emulate merge (handles unequal)                                                                           
                Keintz, Mark                                                                                              
                mkeintz@wharton.upenn.edu                                                                                 
                                                                                                                          
             g. data _null_ uequal                                                                                        
                data _null_,                                                                                              
                datanull@gmail.com                                                                                        
                                                                                                                          
    github                                                                                                                
    https://tinyurl.com/y6gjhkwn                                                                                          
    https://github.com/rogerjdeangelis/utl-interleaving-observations-from-two-equal-size-groups                           
                                                                                                                          
    github                                                                                                                
    https://tinyurl.com/y5qr7euo                                                                                          
    https://communities.sas.com/t5/SAS-Programming/How-to-print-variable-observations-alternatively/m-p/588716            
                                                                                                                          
    KSharpe                                                                                                               
    https://communities.sas.com/t5/user/viewprofilepage/user-id/18408                                                     
                                                                                                                          
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
      put p=;                                                                                                             
      set have nobs=n point=p;                                                                                            
      output;                                                                                                             
    end;                                                                                                                  
    stop;                                                                                                                 
    run;                                                                                                                  
                                                                                                                          
    /*                                                                                                                    
    P=1                                                                                                                   
    P=5                                                                                                                   
    P=2                                                                                                                   
    P=6                                                                                                                   
    P=3                                                                                                                   
    P=7                                                                                                                   
    P=4                                                                                                                   
    P=8                                                                                                                   
    */                                                                                                                    
                                                                                                                          
    *    _     ____             _                                                                                         
      __| |   |  _ \ __ _ _   _| |  _ __ ___   ___ _ __ __ _  ___                                                         
     / _` |   | |_) / _` | | | | | | '_ ` _ \ / _ \ '__/ _` |/ _ \                                                        
    | (_| |_  |  __/ (_| | |_| | | | | | | | |  __/ | | (_| |  __/                                                        
     \__,_(_) |_|   \__,_|\__,_|_| |_| |_| |_|\___|_|  \__, |\___|                                                        
                                                       |___/                                                              
    ;                                                                                                                     
                                                                                                                          
                                                                                                                          
    Paul Dorfman                                                                                                          
                                                                                                                          
    Roger,                                                                                                                
                                                                                                                          
    Just out of sheer geekery:                                                                                            
                                                                                                                          
    data have ;                                                                                                           
      input (name sex) ($) ;                                                                                              
      cards ;                                                                                                             
    Alice  F                                                                                                              
    Beth   F                                                                                                              
    Carol  F                                                                                                              
    Doris  F                                                                                                              
    Alex   M                                                                                                              
    Bob    M                                                                                                              
    Cary   M                                                                                                              
    Doug   M                                                                                                              
    ;                                                                                                                     
    run ;                                                                                                                 
                                                                                                                          
    data want (drop = _:) ;                                                                                               
      merge have (where=(sex="F")) have (where=(_s="M") rename=(name=_n sex=_s)) ;                                        
      output ;                                                                                                            
      name = _n ;                                                                                                         
      sex  = _s ;                                                                                                         
      output ;                                                                                                            
    run ;                                                                                                                 
                                                                                                                          
    This has the advantage that if someone has no pair, the would-be                                                      
    corresponding counterpart record will be there with missing values.                                                   
    For instance, if we delete the input record for Alice, we'll get:                                                     
                                                                                                                          
    Up to 40 obs WORK.WANT total obs=8                                                                                    
                                                                                                                          
    Obs    NAME     SEX                                                                                                   
                                                                                                                          
     1     Alice     F                                                                                                    
     2     Alex      M                                                                                                    
     3     Beth      F                                                                                                    
     4     Bob       M                                                                                                    
     5     Carol     F                                                                                                    
     6     Cary      M                                                                                                    
     7     Doris     F                                                                                                    
     8     Doug      M                                                                                                    
                                                                                                                          
    Best regards                                                                                                          
                                                                                                                          
    *           ___                                       _                                                               
      ___      / _ \   _   _ _ __   ___  __ _ _   _  __ _| |                                                              
     / _ \    | | | | | | | | '_ \ / _ \/ _` | | | |/ _` | |                                                              
    |  __/_   | |_| | | |_| | | | |  __/ (_| | |_| | (_| | |                                                              
     \___(_)   \__\_\  \__,_|_| |_|\___|\__, |\__,_|\__,_|_|                                                              
                                           |_|                                                                            
    ;                                                                                                                     
                                                                                                                          
    Quentin,                                                                                                              
                                                                                                                          
    Maybe this is suitable.  I think the issue is that _ALL_ is all defined at that point.                                
                                                                                                                          
    data have ;                                                                                                           
      input (name sex) ($) ;                                                                                              
      cards ;                                                                                                             
    Alice  F                                                                                                              
    Beth   F                                                                                                              
    Carol  F                                                                                                              
    Doris  F                                                                                                              
    Alex   M                                                                                                              
    Bob    M                                                                                                              
    Cary   M                                                                                                              
    ;                                                                                                                     
    run ;                                                                                                                 
                                                                                                                          
    Hi Mark,                                                                                                              
                                                                                                                          
    That second CALL MISSING(of _all_) can set end_m to null, which will cause all kinds of problems.                     
    Since in this case you're reading the same data set twice and know both SET statements                                
    read the same same variables, I don't think you need the CALL MISSING.                                                
                                                                                                                          
    Maybe something like:                                                                                                 
                                                                                                                          
    data want;                                                                                                            
      if end_m=0 then do ;                                                                                                
        set have (where=(sex='M')) end=end_m;                                                                             
        output;                                                                                                           
      end ;                                                                                                               
      if end_f=0 then do ;                                                                                                
        set have (where=(sex='F')) end=end_f;                                                                             
        output;                                                                                                           
      end ;                                                                                                               
      if sum(of end_:)=n(of end_:) then stop; *nice trick;                                                                
    run;                                                                                                                  
                                                                                                                          
    * __    __  __            _      _ _ _                                                                                
     / _|  |  \/  | __ _ _ __| | __ | (_) | _____   _ __ ___   ___ _ __ __ _  ___                                         
    | |_   | |\/| |/ _` | '__| |/ / | | | |/ / _ \ | '_ ` _ \ / _ \ '__/ _` |/ _ \                                        
    |  _|  | |  | | (_| | |  |   <  | | |   <  __/ | | | | | |  __/ | | (_| |  __/                                        
    |_|(_) |_|  |_|\__,_|_|  |_|\_\ |_|_|_|\_\___| |_| |_| |_|\___|_|  \__, |\___|                                        
                                                                       |___/                                              
    ;                                                                                                                     
                                                                                                                          
    data have ;                                                                                                           
      input (name sex) ($) ;                                                                                              
      cards ;                                                                                                             
    Alice  F                                                                                                              
    Beth   F                                                                                                              
    Carol  F                                                                                                              
    Doris  F                                                                                                              
    Alex   M                                                                                                              
    Bob    M                                                                                                              
    Cary   M                                                                                                              
    Doug   M                                                                                                              
    ;                                                                                                                     
    run ;                                                                                                                 
                                                                                                                          
    data want;                                                                                                            
                                                                                                                          
      if end_m then call missing(of _all_);                                                                               
      else set have (where=(sex='M')) end=end_m;                                                                          
      output;                                                                                                             
                                                                                                                          
      if end_f then call missing(of _all_);                                                                               
      else set have (where=(sex='F')) end=end_f;                                                                          
      output;                                                                                                             
                                                                                                                          
      if sum(of end_:)=n(of end_:) then stop;                                                                             
    run;                                                                                                                  
                                                                                                                          
    The "if sum(of end_:)=n(of end_:) then stop is a handy way to get multiple                                            
    SETs to emulate the MERGE behavior of avoiding premature ending                                                       
    of the data step due to a short data stream.                                                                          
                                                                                                                          
    And if there were multiple streams to interleave, maybe something like ...                                            
                                                                                                                          
    %macro subset(sex=);                                                                                                  
      if end_&sex then call missing(of _all_);                                                                            
      else set have (where=(sex="&sex")) end=end_&sex;                                                                    
      output                                                                                                              
    %mend;                                                                                                                
                                                                                                                          
    data want;                                                                                                            
      %subset(sex=M);                                                                                                     
      %subset(sex=F);                                                                                                     
      %subset(sex=X);                                                                                                     
      if sum(of end_:)=n(of end_:) then stop;                                                                             
    run;                                                                                                                  
                                                                                                                          
    *          ____        _                    _ _                                                                       
      __ _    |  _ \  __ _| |_ __ _ _ __  _   _| | |  _   _ _ __   ___  __ _                                              
     / _` |   | | | |/ _` | __/ _` | '_ \| | | | | | | | | | '_ \ / _ \/ _` |                                             
    | (_| |_  | |_| | (_| | || (_| | | | | |_| | | | | |_| | | | |  __/ (_| |                                             
     \__, (_) |____/ \__,_|\__\__,_|_| |_|\__,_|_|_|  \__,_|_| |_|\___|\__, |                                             
     |___/                                                                |_|                                             
    ;                                                                                                                     
                                                                                                                          
    data have ;                                                                                                           
      input (name sex) ($) ;                                                                                              
      cards ;                                                                                                             
    Alice  F                                                                                                              
    Beth   F                                                                                                              
    Carol  F                                                                                                              
    Doris  F                                                                                                              
    Alex   M                                                                                                              
    Bob    M                                                                                                              
    Cary   M                                                                                                              
    ;                                                                                                                     
    run ;                                                                                                                 
                                                                                                                          
                                                                                                                          
    data want;                                                                                                            
       if not end_m then do;                                                                                              
          set have (where=(sex='M')) end=end_m;                                                                           
          output;                                                                                                         
          end;                                                                                                            
       link reset;                                                                                                        
       if not end_f then do;                                                                                              
          set have (where=(sex='F')) end=end_f;                                                                           
          output;                                                                                                         
          end;                                                                                                            
       if sum(of end_:)=n(of end_:) then stop;                                                                            
     reset:                                                                                                               
       call missing(of _all_);                                                                                            
       put _all_;                                                                                                         
       return;                                                                                                            
       run;                                                                                                               
                                                                                                                          
                                                                                                                          
