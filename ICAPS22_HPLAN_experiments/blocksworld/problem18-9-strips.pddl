( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b706 - block
    b588 - block
    b825 - block
    b766 - block
    b794 - block
    b604 - block
    b199 - block
    b423 - block
    b882 - block
    b541 - block
    b755 - block
    b440 - block
    b102 - block
    b690 - block
    b428 - block
    b575 - block
    b724 - block
    b634 - block
    b716 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b706 )
    ( on b588 b706 )
    ( on b825 b588 )
    ( on b766 b825 )
    ( on b794 b766 )
    ( on b604 b794 )
    ( on b199 b604 )
    ( on b423 b199 )
    ( on b882 b423 )
    ( on b541 b882 )
    ( on b755 b541 )
    ( on b440 b755 )
    ( on b102 b440 )
    ( on b690 b102 )
    ( on b428 b690 )
    ( on b575 b428 )
    ( on b724 b575 )
    ( on b634 b724 )
    ( on b716 b634 )
    ( clear b716 )
  )
  ( :goal
    ( and
      ( clear b706 )
    )
  )
)
