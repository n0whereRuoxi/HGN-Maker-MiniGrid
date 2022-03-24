( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b694 - block
    b594 - block
    b308 - block
    b877 - block
    b665 - block
    b320 - block
    b541 - block
    b201 - block
    b56 - block
    b638 - block
    b322 - block
    b966 - block
    b813 - block
    b342 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b694 )
    ( on b594 b694 )
    ( on b308 b594 )
    ( on b877 b308 )
    ( on b665 b877 )
    ( on b320 b665 )
    ( on b541 b320 )
    ( on b201 b541 )
    ( on b56 b201 )
    ( on b638 b56 )
    ( on b322 b638 )
    ( on b966 b322 )
    ( on b813 b966 )
    ( on b342 b813 )
    ( clear b342 )
  )
  ( :goal
    ( and
      ( clear b694 )
    )
  )
)
