( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b233 - block
    b174 - block
    b835 - block
    b488 - block
    b992 - block
    b584 - block
    b689 - block
    b812 - block
    b921 - block
    b735 - block
    b226 - block
    b690 - block
    b242 - block
    b947 - block
    b202 - block
    b577 - block
    b808 - block
    b493 - block
    b722 - block
    b530 - block
    b698 - block
    b320 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b233 )
    ( on b174 b233 )
    ( on b835 b174 )
    ( on b488 b835 )
    ( on b992 b488 )
    ( on b584 b992 )
    ( on b689 b584 )
    ( on b812 b689 )
    ( on b921 b812 )
    ( on b735 b921 )
    ( on b226 b735 )
    ( on b690 b226 )
    ( on b242 b690 )
    ( on b947 b242 )
    ( on b202 b947 )
    ( on b577 b202 )
    ( on b808 b577 )
    ( on b493 b808 )
    ( on b722 b493 )
    ( on b530 b722 )
    ( on b698 b530 )
    ( on b320 b698 )
    ( clear b320 )
  )
  ( :goal
    ( and
      ( clear b233 )
    )
  )
)
