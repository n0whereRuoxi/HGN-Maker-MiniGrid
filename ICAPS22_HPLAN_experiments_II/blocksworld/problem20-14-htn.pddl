( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b448 - block
    b24 - block
    b895 - block
    b162 - block
    b194 - block
    b251 - block
    b645 - block
    b690 - block
    b990 - block
    b240 - block
    b317 - block
    b407 - block
    b931 - block
    b134 - block
    b406 - block
    b424 - block
    b246 - block
    b364 - block
    b469 - block
    b570 - block
    b595 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b448 )
    ( on b24 b448 )
    ( on b895 b24 )
    ( on b162 b895 )
    ( on b194 b162 )
    ( on b251 b194 )
    ( on b645 b251 )
    ( on b690 b645 )
    ( on b990 b690 )
    ( on b240 b990 )
    ( on b317 b240 )
    ( on b407 b317 )
    ( on b931 b407 )
    ( on b134 b931 )
    ( on b406 b134 )
    ( on b424 b406 )
    ( on b246 b424 )
    ( on b364 b246 )
    ( on b469 b364 )
    ( on b570 b469 )
    ( on b595 b570 )
    ( clear b595 )
  )
  ( :tasks
    ( Make-20Pile b24 b895 b162 b194 b251 b645 b690 b990 b240 b317 b407 b931 b134 b406 b424 b246 b364 b469 b570 b595 )
  )
)
