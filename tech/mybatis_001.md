# mybatis_bulk_insert


### xml

```xml
    <insert id="bulkInsert" parameterType="map">
 
      insert into calendar
      
          (
              year,
              month,
              delete_flg
         )
  
          values
  
      <foreach item="p" collection="list" separator=",">
          (        
              #{p.year,jdbcType=INTEGER},
              #{p.month,jdbcType=INTEGER},
              #{p.deleteFlg,jdbcType=CHAR}
         )
      </foreach>
    </insert>
```


### java

```java

public interface CalendarMapper {

	public int bulkInsert(List<CalendarDto> list);

}

```
