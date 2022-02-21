( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b137 - block
    b452 - block
    b997 - block
    b776 - block
    b968 - block
    b128 - block
    b292 - block
    b178 - block
    b262 - block
    b162 - block
    b645 - block
    b321 - block
    b733 - block
    b739 - block
    b896 - block
    b446 - block
    b560 - block
    b436 - block
    b738 - block
    b326 - block
    b900 - block
    b414 - block
    b783 - block
    b38 - block
    b950 - block
    b103 - block
    b16 - block
    b686 - block
    b800 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b137 )
    ( on b452 b137 )
    ( on b997 b452 )
    ( on b776 b997 )
    ( on b968 b776 )
    ( on b128 b968 )
    ( on b292 b128 )
    ( on b178 b292 )
    ( on b262 b178 )
    ( on b162 b262 )
    ( on b645 b162 )
    ( on b321 b645 )
    ( on b733 b321 )
    ( on b739 b733 )
    ( on b896 b739 )
    ( on b446 b896 )
    ( on b560 b446 )
    ( on b436 b560 )
    ( on b738 b436 )
    ( on b326 b738 )
    ( on b900 b326 )
    ( on b414 b900 )
    ( on b783 b414 )
    ( on b38 b783 )
    ( on b950 b38 )
    ( on b103 b950 )
    ( on b16 b103 )
    ( on b686 b16 )
    ( on b800 b686 )
    ( clear b800 )
  )
  ( :goal
    ( and
      ( clear b137 )
    )
  )
)
