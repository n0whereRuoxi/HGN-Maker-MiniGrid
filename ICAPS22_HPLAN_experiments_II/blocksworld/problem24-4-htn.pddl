( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b841 - block
    b280 - block
    b241 - block
    b558 - block
    b938 - block
    b258 - block
    b654 - block
    b475 - block
    b840 - block
    b168 - block
    b477 - block
    b512 - block
    b293 - block
    b392 - block
    b833 - block
    b650 - block
    b516 - block
    b403 - block
    b989 - block
    b128 - block
    b109 - block
    b244 - block
    b567 - block
    b845 - block
    b725 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b841 )
    ( on b280 b841 )
    ( on b241 b280 )
    ( on b558 b241 )
    ( on b938 b558 )
    ( on b258 b938 )
    ( on b654 b258 )
    ( on b475 b654 )
    ( on b840 b475 )
    ( on b168 b840 )
    ( on b477 b168 )
    ( on b512 b477 )
    ( on b293 b512 )
    ( on b392 b293 )
    ( on b833 b392 )
    ( on b650 b833 )
    ( on b516 b650 )
    ( on b403 b516 )
    ( on b989 b403 )
    ( on b128 b989 )
    ( on b109 b128 )
    ( on b244 b109 )
    ( on b567 b244 )
    ( on b845 b567 )
    ( on b725 b845 )
    ( clear b725 )
  )
  ( :tasks
    ( Make-24Pile b280 b241 b558 b938 b258 b654 b475 b840 b168 b477 b512 b293 b392 b833 b650 b516 b403 b989 b128 b109 b244 b567 b845 b725 )
  )
)
