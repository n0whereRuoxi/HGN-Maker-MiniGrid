( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b228 - block
    b961 - block
    b791 - block
    b307 - block
    b839 - block
    b203 - block
    b946 - block
    b502 - block
    b405 - block
    b651 - block
    b640 - block
    b67 - block
    b942 - block
    b584 - block
    b422 - block
    b870 - block
    b974 - block
    b686 - block
    b810 - block
    b389 - block
    b778 - block
    b763 - block
    b25 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b228 )
    ( on b961 b228 )
    ( on b791 b961 )
    ( on b307 b791 )
    ( on b839 b307 )
    ( on b203 b839 )
    ( on b946 b203 )
    ( on b502 b946 )
    ( on b405 b502 )
    ( on b651 b405 )
    ( on b640 b651 )
    ( on b67 b640 )
    ( on b942 b67 )
    ( on b584 b942 )
    ( on b422 b584 )
    ( on b870 b422 )
    ( on b974 b870 )
    ( on b686 b974 )
    ( on b810 b686 )
    ( on b389 b810 )
    ( on b778 b389 )
    ( on b763 b778 )
    ( on b25 b763 )
    ( clear b25 )
  )
  ( :goal
    ( and
      ( clear b228 )
    )
  )
)
