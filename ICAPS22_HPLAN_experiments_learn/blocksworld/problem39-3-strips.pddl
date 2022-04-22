( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b241 - block
    b199 - block
    b501 - block
    b222 - block
    b482 - block
    b623 - block
    b567 - block
    b998 - block
    b869 - block
    b23 - block
    b607 - block
    b671 - block
    b68 - block
    b867 - block
    b608 - block
    b563 - block
    b701 - block
    b394 - block
    b135 - block
    b156 - block
    b330 - block
    b500 - block
    b71 - block
    b525 - block
    b403 - block
    b512 - block
    b277 - block
    b161 - block
    b418 - block
    b676 - block
    b614 - block
    b336 - block
    b544 - block
    b364 - block
    b395 - block
    b830 - block
    b294 - block
    b808 - block
    b986 - block
    b211 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b241 )
    ( on b199 b241 )
    ( on b501 b199 )
    ( on b222 b501 )
    ( on b482 b222 )
    ( on b623 b482 )
    ( on b567 b623 )
    ( on b998 b567 )
    ( on b869 b998 )
    ( on b23 b869 )
    ( on b607 b23 )
    ( on b671 b607 )
    ( on b68 b671 )
    ( on b867 b68 )
    ( on b608 b867 )
    ( on b563 b608 )
    ( on b701 b563 )
    ( on b394 b701 )
    ( on b135 b394 )
    ( on b156 b135 )
    ( on b330 b156 )
    ( on b500 b330 )
    ( on b71 b500 )
    ( on b525 b71 )
    ( on b403 b525 )
    ( on b512 b403 )
    ( on b277 b512 )
    ( on b161 b277 )
    ( on b418 b161 )
    ( on b676 b418 )
    ( on b614 b676 )
    ( on b336 b614 )
    ( on b544 b336 )
    ( on b364 b544 )
    ( on b395 b364 )
    ( on b830 b395 )
    ( on b294 b830 )
    ( on b808 b294 )
    ( on b986 b808 )
    ( on b211 b986 )
    ( clear b211 )
  )
  ( :goal
    ( and
      ( clear b241 )
    )
  )
)
