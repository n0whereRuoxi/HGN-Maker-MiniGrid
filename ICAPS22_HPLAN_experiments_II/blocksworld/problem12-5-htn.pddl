( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b47 - block
    b302 - block
    b596 - block
    b62 - block
    b321 - block
    b514 - block
    b787 - block
    b257 - block
    b892 - block
    b282 - block
    b645 - block
    b75 - block
    b656 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b47 )
    ( on b302 b47 )
    ( on b596 b302 )
    ( on b62 b596 )
    ( on b321 b62 )
    ( on b514 b321 )
    ( on b787 b514 )
    ( on b257 b787 )
    ( on b892 b257 )
    ( on b282 b892 )
    ( on b645 b282 )
    ( on b75 b645 )
    ( on b656 b75 )
    ( clear b656 )
  )
  ( :tasks
    ( Make-12Pile b302 b596 b62 b321 b514 b787 b257 b892 b282 b645 b75 b656 )
  )
)
