( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b587 - block
    b151 - block
    b625 - block
    b649 - block
    b719 - block
    b368 - block
    b602 - block
    b379 - block
    b568 - block
    b728 - block
    b328 - block
    b250 - block
    b469 - block
    b554 - block
    b688 - block
    b544 - block
    b313 - block
    b616 - block
    b693 - block
    b84 - block
    b433 - block
    b900 - block
    b193 - block
    b202 - block
    b556 - block
    b792 - block
    b349 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b587 )
    ( on b151 b587 )
    ( on b625 b151 )
    ( on b649 b625 )
    ( on b719 b649 )
    ( on b368 b719 )
    ( on b602 b368 )
    ( on b379 b602 )
    ( on b568 b379 )
    ( on b728 b568 )
    ( on b328 b728 )
    ( on b250 b328 )
    ( on b469 b250 )
    ( on b554 b469 )
    ( on b688 b554 )
    ( on b544 b688 )
    ( on b313 b544 )
    ( on b616 b313 )
    ( on b693 b616 )
    ( on b84 b693 )
    ( on b433 b84 )
    ( on b900 b433 )
    ( on b193 b900 )
    ( on b202 b193 )
    ( on b556 b202 )
    ( on b792 b556 )
    ( on b349 b792 )
    ( clear b349 )
  )
  ( :goal
    ( and
      ( clear b587 )
    )
  )
)
