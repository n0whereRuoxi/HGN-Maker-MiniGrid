( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b410 - block
    b66 - block
    b699 - block
    b523 - block
    b251 - block
    b548 - block
    b715 - block
    b884 - block
    b250 - block
    b56 - block
    b314 - block
    b975 - block
    b574 - block
    b182 - block
    b591 - block
    b944 - block
    b181 - block
    b268 - block
    b237 - block
    b373 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b410 )
    ( on b66 b410 )
    ( on b699 b66 )
    ( on b523 b699 )
    ( on b251 b523 )
    ( on b548 b251 )
    ( on b715 b548 )
    ( on b884 b715 )
    ( on b250 b884 )
    ( on b56 b250 )
    ( on b314 b56 )
    ( on b975 b314 )
    ( on b574 b975 )
    ( on b182 b574 )
    ( on b591 b182 )
    ( on b944 b591 )
    ( on b181 b944 )
    ( on b268 b181 )
    ( on b237 b268 )
    ( on b373 b237 )
    ( clear b373 )
  )
  ( :tasks
    ( Make-19Pile b66 b699 b523 b251 b548 b715 b884 b250 b56 b314 b975 b574 b182 b591 b944 b181 b268 b237 b373 )
  )
)
