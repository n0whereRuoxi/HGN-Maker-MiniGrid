( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b814 - block
    b597 - block
    b341 - block
    b990 - block
    b937 - block
    b633 - block
    b856 - block
    b821 - block
    b785 - block
    b412 - block
    b511 - block
    b207 - block
    b655 - block
    b221 - block
    b799 - block
    b962 - block
    b971 - block
    b886 - block
    b264 - block
    b508 - block
    b534 - block
    b715 - block
    b431 - block
    b332 - block
    b315 - block
    b736 - block
    b162 - block
    b422 - block
    b473 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b814 )
    ( on b597 b814 )
    ( on b341 b597 )
    ( on b990 b341 )
    ( on b937 b990 )
    ( on b633 b937 )
    ( on b856 b633 )
    ( on b821 b856 )
    ( on b785 b821 )
    ( on b412 b785 )
    ( on b511 b412 )
    ( on b207 b511 )
    ( on b655 b207 )
    ( on b221 b655 )
    ( on b799 b221 )
    ( on b962 b799 )
    ( on b971 b962 )
    ( on b886 b971 )
    ( on b264 b886 )
    ( on b508 b264 )
    ( on b534 b508 )
    ( on b715 b534 )
    ( on b431 b715 )
    ( on b332 b431 )
    ( on b315 b332 )
    ( on b736 b315 )
    ( on b162 b736 )
    ( on b422 b162 )
    ( on b473 b422 )
    ( clear b473 )
  )
  ( :goal
    ( and
      ( clear b814 )
    )
  )
)
