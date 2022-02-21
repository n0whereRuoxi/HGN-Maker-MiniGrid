( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b111 - block
    b646 - block
    b897 - block
    b595 - block
    b28 - block
    b992 - block
    b483 - block
    b257 - block
    b914 - block
    b38 - block
    b731 - block
    b621 - block
    b801 - block
    b990 - block
    b36 - block
    b19 - block
    b785 - block
    b636 - block
    b530 - block
    b15 - block
    b590 - block
    b855 - block
    b937 - block
    b754 - block
    b228 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b111 )
    ( on b646 b111 )
    ( on b897 b646 )
    ( on b595 b897 )
    ( on b28 b595 )
    ( on b992 b28 )
    ( on b483 b992 )
    ( on b257 b483 )
    ( on b914 b257 )
    ( on b38 b914 )
    ( on b731 b38 )
    ( on b621 b731 )
    ( on b801 b621 )
    ( on b990 b801 )
    ( on b36 b990 )
    ( on b19 b36 )
    ( on b785 b19 )
    ( on b636 b785 )
    ( on b530 b636 )
    ( on b15 b530 )
    ( on b590 b15 )
    ( on b855 b590 )
    ( on b937 b855 )
    ( on b754 b937 )
    ( on b228 b754 )
    ( clear b228 )
  )
  ( :goal
    ( and
      ( clear b111 )
    )
  )
)
