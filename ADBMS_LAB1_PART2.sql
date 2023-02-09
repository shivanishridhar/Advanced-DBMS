/* Review of the Data Hierarchy, Data Aggregation and Horizontal Reporting */ 
 
/* Use AdventureWorks2017 database */ 
 
/* The following code creates a longlist report. */ 
 
SELECT DISTINCT h.SalesPersonID, p.FirstName, p.LastName, d.ProductID 
FROM Sales.SalesOrderHeader h 
join Sales.SalesOrderDetail d 
on d.SalesOrderID=h.SalesOrderID 
JOIN Person.Person p 
ON h.SalesPersonID = p.BusinessEntityID 
ORDER BY h.SalesPersonID, ProductID; 
 
 /* SalesPersonID	FirstName	LastName	ProductID
274	Stephen	Jiang	707
274	Stephen	Jiang	708
274	Stephen	Jiang	709
274	Stephen	Jiang	711
274	Stephen	Jiang	712
274	Stephen	Jiang	714
274	Stephen	Jiang	715
274	Stephen	Jiang	716
274	Stephen	Jiang	717
274	Stephen	Jiang	718
274	Stephen	Jiang	722
274	Stephen	Jiang	725
274	Stephen	Jiang	726
274	Stephen	Jiang	729
274	Stephen	Jiang	730
274	Stephen	Jiang	738
274	Stephen	Jiang	739
274	Stephen	Jiang	741
274	Stephen	Jiang	742
274	Stephen	Jiang	743
274	Stephen	Jiang	744
274	Stephen	Jiang	745
274	Stephen	Jiang	747
274	Stephen	Jiang	748
274	Stephen	Jiang	749
274	Stephen	Jiang	750
274	Stephen	Jiang	751
274	Stephen	Jiang	752
274	Stephen	Jiang	753
274	Stephen	Jiang	754
274	Stephen	Jiang	755
274	Stephen	Jiang	756
274	Stephen	Jiang	757
274	Stephen	Jiang	758
274	Stephen	Jiang	759
274	Stephen	Jiang	760
274	Stephen	Jiang	761
274	Stephen	Jiang	762
274	Stephen	Jiang	763
274	Stephen	Jiang	764
274	Stephen	Jiang	765
274	Stephen	Jiang	766
274	Stephen	Jiang	767
274	Stephen	Jiang	768
274	Stephen	Jiang	769
274	Stephen	Jiang	770
274	Stephen	Jiang	771
274	Stephen	Jiang	772
274	Stephen	Jiang	773
274	Stephen	Jiang	774
274	Stephen	Jiang	775
274	Stephen	Jiang	776
274	Stephen	Jiang	777
274	Stephen	Jiang	778
274	Stephen	Jiang	779
274	Stephen	Jiang	780
274	Stephen	Jiang	781
274	Stephen	Jiang	782
274	Stephen	Jiang	783
274	Stephen	Jiang	784
274	Stephen	Jiang	785
274	Stephen	Jiang	786
274	Stephen	Jiang	787
274	Stephen	Jiang	788
274	Stephen	Jiang	789
274	Stephen	Jiang	790
274	Stephen	Jiang	791
274	Stephen	Jiang	792
274	Stephen	Jiang	793
274	Stephen	Jiang	794
274	Stephen	Jiang	795
274	Stephen	Jiang	796
274	Stephen	Jiang	797
274	Stephen	Jiang	798
274	Stephen	Jiang	799
274	Stephen	Jiang	800
274	Stephen	Jiang	801
274	Stephen	Jiang	802
274	Stephen	Jiang	804
274	Stephen	Jiang	805
274	Stephen	Jiang	806
274	Stephen	Jiang	807
274	Stephen	Jiang	808
274	Stephen	Jiang	809
274	Stephen	Jiang	810
274	Stephen	Jiang	813
274	Stephen	Jiang	814
274	Stephen	Jiang	815
274	Stephen	Jiang	816
274	Stephen	Jiang	817
274	Stephen	Jiang	819
274	Stephen	Jiang	820
274	Stephen	Jiang	822
274	Stephen	Jiang	823
274	Stephen	Jiang	824
274	Stephen	Jiang	825
274	Stephen	Jiang	826
274	Stephen	Jiang	830
274	Stephen	Jiang	831
274	Stephen	Jiang	832
274	Stephen	Jiang	835
274	Stephen	Jiang	836
274	Stephen	Jiang	838
274	Stephen	Jiang	841
274	Stephen	Jiang	843
274	Stephen	Jiang	844
274	Stephen	Jiang	849
274	Stephen	Jiang	850
274	Stephen	Jiang	852
274	Stephen	Jiang	853
274	Stephen	Jiang	854
274	Stephen	Jiang	855
274	Stephen	Jiang	856
274	Stephen	Jiang	857
274	Stephen	Jiang	858
274	Stephen	Jiang	859
274	Stephen	Jiang	860
274	Stephen	Jiang	861
274	Stephen	Jiang	862
274	Stephen	Jiang	863
274	Stephen	Jiang	864
274	Stephen	Jiang	865
274	Stephen	Jiang	867
274	Stephen	Jiang	868
274	Stephen	Jiang	869
274	Stephen	Jiang	870
274	Stephen	Jiang	873
274	Stephen	Jiang	874
274	Stephen	Jiang	875
274	Stephen	Jiang	876
274	Stephen	Jiang	877
274	Stephen	Jiang	880
274	Stephen	Jiang	881
274	Stephen	Jiang	883
274	Stephen	Jiang	884
274	Stephen	Jiang	885
274	Stephen	Jiang	886
274	Stephen	Jiang	889
274	Stephen	Jiang	892
274	Stephen	Jiang	893
274	Stephen	Jiang	894
274	Stephen	Jiang	895
274	Stephen	Jiang	896
274	Stephen	Jiang	899
274	Stephen	Jiang	900
274	Stephen	Jiang	902
274	Stephen	Jiang	904
274	Stephen	Jiang	905
274	Stephen	Jiang	906
274	Stephen	Jiang	907
274	Stephen	Jiang	908
274	Stephen	Jiang	909
274	Stephen	Jiang	910
274	Stephen	Jiang	913
274	Stephen	Jiang	914
274	Stephen	Jiang	916
274	Stephen	Jiang	917
274	Stephen	Jiang	918
274	Stephen	Jiang	919
274	Stephen	Jiang	920
274	Stephen	Jiang	924
274	Stephen	Jiang	925
274	Stephen	Jiang	926
274	Stephen	Jiang	935
274	Stephen	Jiang	936
274	Stephen	Jiang	937
274	Stephen	Jiang	938
274	Stephen	Jiang	939
274	Stephen	Jiang	940
274	Stephen	Jiang	944
274	Stephen	Jiang	945
274	Stephen	Jiang	947
274	Stephen	Jiang	948
274	Stephen	Jiang	949
274	Stephen	Jiang	950
274	Stephen	Jiang	951
274	Stephen	Jiang	952
274	Stephen	Jiang	953
274	Stephen	Jiang	954
274	Stephen	Jiang	955
274	Stephen	Jiang	956
274	Stephen	Jiang	957
274	Stephen	Jiang	958
274	Stephen	Jiang	961
274	Stephen	Jiang	962
274	Stephen	Jiang	965
274	Stephen	Jiang	966
274	Stephen	Jiang	967
274	Stephen	Jiang	968
274	Stephen	Jiang	969
274	Stephen	Jiang	972
274	Stephen	Jiang	973
274	Stephen	Jiang	974
274	Stephen	Jiang	975
274	Stephen	Jiang	976
274	Stephen	Jiang	977
274	Stephen	Jiang	979
274	Stephen	Jiang	980
274	Stephen	Jiang	981
274	Stephen	Jiang	982
274	Stephen	Jiang	983
274	Stephen	Jiang	984
274	Stephen	Jiang	985
274	Stephen	Jiang	986
274	Stephen	Jiang	987
274	Stephen	Jiang	988
274	Stephen	Jiang	989
274	Stephen	Jiang	990
274	Stephen	Jiang	991
274	Stephen	Jiang	992
274	Stephen	Jiang	993
274	Stephen	Jiang	994
274	Stephen	Jiang	996
274	Stephen	Jiang	997
274	Stephen	Jiang	998
274	Stephen	Jiang	999
275	Michael	Blythe	707
275	Michael	Blythe	708
275	Michael	Blythe	709
275	Michael	Blythe	710
275	Michael	Blythe	711
275	Michael	Blythe	712
275	Michael	Blythe	714
275	Michael	Blythe	715
275	Michael	Blythe	716
275	Michael	Blythe	717
275	Michael	Blythe	718
275	Michael	Blythe	719
275	Michael	Blythe	722
275	Michael	Blythe	723
275	Michael	Blythe	725
275	Michael	Blythe	726
275	Michael	Blythe	727
275	Michael	Blythe	729
275	Michael	Blythe	730
275	Michael	Blythe	732
275	Michael	Blythe	733
275	Michael	Blythe	736
275	Michael	Blythe	738
275	Michael	Blythe	739
275	Michael	Blythe	741
275	Michael	Blythe	742
275	Michael	Blythe	743
275	Michael	Blythe	744
275	Michael	Blythe	745
275	Michael	Blythe	747
275	Michael	Blythe	748
275	Michael	Blythe	749
275	Michael	Blythe	750
275	Michael	Blythe	751
275	Michael	Blythe	752
275	Michael	Blythe	753
275	Michael	Blythe	754
275	Michael	Blythe	755
275	Michael	Blythe	756
275	Michael	Blythe	757
275	Michael	Blythe	758
275	Michael	Blythe	759
275	Michael	Blythe	760
275	Michael	Blythe	761
275	Michael	Blythe	762
275	Michael	Blythe	763
275	Michael	Blythe	764
275	Michael	Blythe	765
275	Michael	Blythe	766
275	Michael	Blythe	767
275	Michael	Blythe	768
275	Michael	Blythe	769
275	Michael	Blythe	770
275	Michael	Blythe	771
275	Michael	Blythe	772
275	Michael	Blythe	773
275	Michael	Blythe	774
275	Michael	Blythe	775*/

 
/* We want to create a shortlist report containing the same data 
   without duplicating the salesperson info. The code below tried to do  
   it but the generated report had an issue. It still duplicated some 
   salesperson info. */ 
 
select distinct sh.SalesPersonID, pp.FirstName,pp.LastName, 
stuff((select ', ', rtrim (cast(ProductID as char)) 
    from Sales.SalesOrderDetail   
    where SalesOrderID= sh.SalesOrderID 
    order by sd.ProductID 
    for xml path('')), 1,2,'' ) as Product 
from Sales.SalesOrderHeader sh 
join  
Sales.SalesOrderDetail sd 
on sd.SalesOrderID=sh.SalesOrderID 
join Person.Person pp 
on pp.BusinessEntityID = sh.SalesPersonID 
order by sh.SalesPersonID; 
 
 
/* Please investigate the issue and find out what caused the issue. 
   Give a detailed explanation of your findings. Writing some code 
   to prove your explanation would be convincing. */ 

/*The query provided will return a shortlist report containing the distinct SalesPersonID, FirstName, LastName, and a concatenated list of Product IDs separated by comma.

The query uses the DISTINCT keyword to eliminate duplicate rows based on the SalesPersonID column.
It joins the SalesOrderHeader table with the SalesOrderDetail table on the SalesOrderID column.
STUFF function is used to concatenate the Product IDs associated with each Sales Order ID and separated by a comma.
The query also uses the join to join the Person table on the BusinessEntityID column
The result is ordered by SalesPersonID and ProductID.
The issue with duplicating salesperson information is due to the way the data is being joined and filtered.
Since there are multiple SalesOrderID for one CustomerID in SalesOrderHeader, the result will show multiple lines.
The solution can be obtained by making a join on the SalerPersonID or to use a GROUP BY clause in the query, to group the result set by SalesPersonID and aggregate the other columns. 
With this, you can ensure that each salesperson only appears once in the report.
Another approach could be using a subquery to filter out duplicate rows from the table before joining it with other tables.
Without the exact data and table structure it's hard to provide a specific solution.
 
 /*select distinct sh.SalesPersonID, sd.SalesOrderID from 
		Sales.SalesOrderHeader sh
		join Sales.SalesOrderDetail sd
		on sh.SalesOrderID=sd.SalesOrderID

276	50214
276	50217
276	50226
276	50227
276	50238
276	50249
276	50254
276	50257
276	50269
276	50270
276	50272
276	50294
276	50296
276	50300
276	50301
276	50304
276	50313
276	50319
276	50322
276	50658
276	50663
276	50688
276	50692
276	50702
276	50707
276	50719
276	50724
276	50737
276	50744
276	50745
276	50754
276	51082
276	51090
276	51106
276	51126
276	51151
276	51165
276	51167
276	51706
276	51707
276	51715
276	51721
276	51722
276	51745
276	51764
276	51783
276	51798
276	51813
276	51822
276	51828
276	51833
276	51844
276	51845
276	51848
276	51849
276	53459
276	53460
276	53470
276	53473
276	53476
276	53491
276	53496
276	53515
276	53531
276	53550
276	53578
276	53582
276	53586
276	53589
276	53596
276	53598
276	53601
276	53606
276	55235
276	55249
276	55256
276	55271
276	55276
276	55285
276	55315
276	55324
276	57025
276	57029
276	57033
276	57036
276	57042
276	57046
276	57062
276	57077
276	57105
276	57121
276	57124
276	57138
276	57139
276	57142
276	57144
276	57153
276	57186
276	58907
276	58909
276	58919
276	58937
276	58942
276	58975
276	58984
276	58988
276	58991
276	59016
276	59017
276	59023
276	59026
276	59030
276	59034
276	59046
276	59049
276	59061
276	61178
276	61188
276	61210
276	61218
276	61253
276	61255
276	63131
276	63143
276	63146
276	63150
276	63155
276	63157
276	63202
276	63212
276	63213
276	63215
276	63257
276	63261
276	63271
276	63275
276	63277
276	63283
276	63291
276	65157
276	65160
276	65176
276	65179
276	65181
276	65184
276	65193
276	65209
276	65244
276	65256
276	65261
276	65279
276	65285
276	65287
276	65289
276	65293
276	65299
276	65303
276	67273
276	67279
276	67298
276	67301
276	67335
276	67336
276	67347
276	69407
276	69409
276	69413
276	69417
276	69422
276	69441
276	69453
276	69471
276	69503
276	69505
276	69514
276	69532
276	69539
276	69546
276	69559
276	69561
276	71774
276	71782
276	71783
276	71796
276	71815
276	71816
276	71845
276	71856
276	71858
276	71863
276	71895
276	71897
276	71899
276	71902
276	71915
276	71920
276	71923
276	71935
277	43667
277	43675
277	43689
277	43691
277	43863
277	43865
277	43874
277	43881
277	43884
277	43896
277	43899
277	43904
277	43906
277	43913
277	44076
277	44079
277	44090
277	44092
277	44093
277	44097
277	44105
277	44107
277	44110
277	44120
277	44124
277	44125
277	44287
277	44296
277	44314
277	44315
277	44482
277	44509
277	44519
277	44528
277	44530
277	44536
277	44543
277	44545
277	44550
277	44556
277	44557
277	44566
277	44742
277	44748
277	44754
277	44755
277	44756
277	44758
277	44767
277	44768
277	44772
277	44785
277	44787
277	44791
277	44793
277	45045
277	45055
277	45070
277	45072
277	45287
277	45291
277	45307
277	45308
277	45322
277	45326
277	45332
277	45334
277	45341
277	45516
277	45519
277	45520
277	45528
277	45532
277	45533
277	45535
277	45536
277	45538
277	45547
277	45550
277	45565
277	45568
277	45569
277	45785
277	45795
277	45810*/
*/

/* Modify the incorrect solution provided above to create the correct  
   report. */ 
 
   with b as (Select sh.SalesPersonID, sd.ProductID from 
	Sales.SalesOrderHeader sh
	join Sales.SalesOrderDetail sd
	on sh.SalesOrderID=sd.SalesOrderID)

select distinct sh.SalesPersonID, pp.FirstName,pp.LastName,
stuff((select ', ', rtrim (cast(ProductID as char))
	   from b
	   where b.SalesPersonID=sh.SalesPersonID
	   order by sd.ProductID
	   for xml path('')), 1,2,'' ) as Product
from Sales.SalesOrderHeader sh 
join  
Sales.SalesOrderDetail sd 
on sd.SalesOrderID=sh.SalesOrderID 
join Person.Person pp 
on pp.BusinessEntityID = sh.SalesPersonID 
order by sh.SalesPersonID; 

 
/* Use STRING_AGG to create the same report */ 


    select a.SalesPersonID, pp.FirstName,pp.LastName, a.product from
(select distinct x.SalesPersonID, STRING_AGG(cast(y.ProductID as nvarchar(max)), ',') as product from Sales.SalesOrderDetail y
	join Sales.SalesOrderHeader x 
	on y.SalesOrderID=x.SalesOrderID
	group by x.SalesPersonID) a
    join Person.Person pp
    on pp.BusinessEntityID =a.SalesPersonID
	order by a.SalesPersonID

 