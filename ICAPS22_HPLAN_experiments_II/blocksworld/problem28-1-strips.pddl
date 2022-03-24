( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b507 - block
    b896 - block
    b698 - block
    b762 - block
    b632 - block
    b685 - block
    b66 - block
    b946 - block
    b547 - block
    b107 - block
    b459 - block
    b849 - block
    b409 - block
    b65 - block
    b329 - block
    b243 - block
    b456 - block
    b436 - block
    b389 - block
    b795 - block
    b280 - block
    b230 - block
    b97 - block
    b673 - block
    b999 - block
    b789 - block
    b457 - block
    b516 - block
    b369 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b507 )
    ( on b896 b507 )
    ( on b698 b896 )
    ( on b762 b698 )
    ( on b632 b762 )
    ( on b685 b632 )
    ( on b66 b685 )
    ( on b946 b66 )
    ( on b547 b946 )
    ( on b107 b547 )
    ( on b459 b107 )
    ( on b849 b459 )
    ( on b409 b849 )
    ( on b65 b409 )
    ( on b329 b65 )
    ( on b243 b329 )
    ( on b456 b243 )
    ( on b436 b456 )
    ( on b389 b436 )
    ( on b795 b389 )
    ( on b280 b795 )
    ( on b230 b280 )
    ( on b97 b230 )
    ( on b673 b97 )
    ( on b999 b673 )
    ( on b789 b999 )
    ( on b457 b789 )
    ( on b516 b457 )
    ( on b369 b516 )
    ( clear b369 )
  )
  ( :goal
    ( and
      ( clear b507 )
    )
  )
)
