( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b536 - block
    b141 - block
    b174 - block
    b109 - block
    b430 - block
    b646 - block
    b745 - block
    b466 - block
    b503 - block
    b786 - block
    b549 - block
    b813 - block
    b837 - block
    b258 - block
    b743 - block
    b684 - block
    b525 - block
    b610 - block
    b392 - block
    b281 - block
    b255 - block
    b250 - block
    b977 - block
    b294 - block
    b688 - block
    b320 - block
    b756 - block
    b417 - block
    b6 - block
    b583 - block
    b316 - block
    b366 - block
    b867 - block
    b58 - block
    b794 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b536 )
    ( on b141 b536 )
    ( on b174 b141 )
    ( on b109 b174 )
    ( on b430 b109 )
    ( on b646 b430 )
    ( on b745 b646 )
    ( on b466 b745 )
    ( on b503 b466 )
    ( on b786 b503 )
    ( on b549 b786 )
    ( on b813 b549 )
    ( on b837 b813 )
    ( on b258 b837 )
    ( on b743 b258 )
    ( on b684 b743 )
    ( on b525 b684 )
    ( on b610 b525 )
    ( on b392 b610 )
    ( on b281 b392 )
    ( on b255 b281 )
    ( on b250 b255 )
    ( on b977 b250 )
    ( on b294 b977 )
    ( on b688 b294 )
    ( on b320 b688 )
    ( on b756 b320 )
    ( on b417 b756 )
    ( on b6 b417 )
    ( on b583 b6 )
    ( on b316 b583 )
    ( on b366 b316 )
    ( on b867 b366 )
    ( on b58 b867 )
    ( on b794 b58 )
    ( clear b794 )
  )
  ( :goal
    ( and
      ( clear b536 )
    )
  )
)
