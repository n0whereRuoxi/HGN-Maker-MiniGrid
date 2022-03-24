( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b328 - block
    b220 - block
    b804 - block
    b922 - block
    b983 - block
    b121 - block
    b744 - block
    b851 - block
    b592 - block
    b423 - block
    b870 - block
    b761 - block
    b992 - block
    b749 - block
    b135 - block
    b643 - block
    b832 - block
    b459 - block
    b906 - block
    b597 - block
    b964 - block
    b122 - block
    b244 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b328 )
    ( on b220 b328 )
    ( on b804 b220 )
    ( on b922 b804 )
    ( on b983 b922 )
    ( on b121 b983 )
    ( on b744 b121 )
    ( on b851 b744 )
    ( on b592 b851 )
    ( on b423 b592 )
    ( on b870 b423 )
    ( on b761 b870 )
    ( on b992 b761 )
    ( on b749 b992 )
    ( on b135 b749 )
    ( on b643 b135 )
    ( on b832 b643 )
    ( on b459 b832 )
    ( on b906 b459 )
    ( on b597 b906 )
    ( on b964 b597 )
    ( on b122 b964 )
    ( on b244 b122 )
    ( clear b244 )
  )
  ( :goal
    ( and
      ( clear b328 )
    )
  )
)
