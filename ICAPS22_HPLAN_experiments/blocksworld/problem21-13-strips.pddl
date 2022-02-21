( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b281 - block
    b589 - block
    b114 - block
    b150 - block
    b330 - block
    b747 - block
    b454 - block
    b478 - block
    b869 - block
    b208 - block
    b942 - block
    b549 - block
    b401 - block
    b6 - block
    b91 - block
    b587 - block
    b998 - block
    b705 - block
    b981 - block
    b333 - block
    b873 - block
    b640 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b281 )
    ( on b589 b281 )
    ( on b114 b589 )
    ( on b150 b114 )
    ( on b330 b150 )
    ( on b747 b330 )
    ( on b454 b747 )
    ( on b478 b454 )
    ( on b869 b478 )
    ( on b208 b869 )
    ( on b942 b208 )
    ( on b549 b942 )
    ( on b401 b549 )
    ( on b6 b401 )
    ( on b91 b6 )
    ( on b587 b91 )
    ( on b998 b587 )
    ( on b705 b998 )
    ( on b981 b705 )
    ( on b333 b981 )
    ( on b873 b333 )
    ( on b640 b873 )
    ( clear b640 )
  )
  ( :goal
    ( and
      ( clear b281 )
    )
  )
)
