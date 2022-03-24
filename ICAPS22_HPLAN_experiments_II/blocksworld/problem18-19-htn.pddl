( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b994 - block
    b712 - block
    b203 - block
    b298 - block
    b339 - block
    b73 - block
    b992 - block
    b677 - block
    b236 - block
    b155 - block
    b362 - block
    b486 - block
    b513 - block
    b383 - block
    b355 - block
    b245 - block
    b637 - block
    b895 - block
    b821 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b994 )
    ( on b712 b994 )
    ( on b203 b712 )
    ( on b298 b203 )
    ( on b339 b298 )
    ( on b73 b339 )
    ( on b992 b73 )
    ( on b677 b992 )
    ( on b236 b677 )
    ( on b155 b236 )
    ( on b362 b155 )
    ( on b486 b362 )
    ( on b513 b486 )
    ( on b383 b513 )
    ( on b355 b383 )
    ( on b245 b355 )
    ( on b637 b245 )
    ( on b895 b637 )
    ( on b821 b895 )
    ( clear b821 )
  )
  ( :tasks
    ( Make-18Pile b712 b203 b298 b339 b73 b992 b677 b236 b155 b362 b486 b513 b383 b355 b245 b637 b895 b821 )
  )
)
