( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b168 - block
    b189 - block
    b176 - block
    b448 - block
    b547 - block
    b974 - block
    b341 - block
    b150 - block
    b948 - block
    b232 - block
    b111 - block
    b604 - block
    b331 - block
    b716 - block
    b261 - block
    b396 - block
    b591 - block
    b813 - block
    b77 - block
    b600 - block
    b565 - block
    b53 - block
    b456 - block
    b417 - block
    b754 - block
    b84 - block
    b295 - block
    b254 - block
    b70 - block
    b125 - block
    b526 - block
    b361 - block
    b881 - block
    b160 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b168 )
    ( on b189 b168 )
    ( on b176 b189 )
    ( on b448 b176 )
    ( on b547 b448 )
    ( on b974 b547 )
    ( on b341 b974 )
    ( on b150 b341 )
    ( on b948 b150 )
    ( on b232 b948 )
    ( on b111 b232 )
    ( on b604 b111 )
    ( on b331 b604 )
    ( on b716 b331 )
    ( on b261 b716 )
    ( on b396 b261 )
    ( on b591 b396 )
    ( on b813 b591 )
    ( on b77 b813 )
    ( on b600 b77 )
    ( on b565 b600 )
    ( on b53 b565 )
    ( on b456 b53 )
    ( on b417 b456 )
    ( on b754 b417 )
    ( on b84 b754 )
    ( on b295 b84 )
    ( on b254 b295 )
    ( on b70 b254 )
    ( on b125 b70 )
    ( on b526 b125 )
    ( on b361 b526 )
    ( on b881 b361 )
    ( on b160 b881 )
    ( clear b160 )
  )
  ( :goal
    ( and
      ( clear b168 )
    )
  )
)
