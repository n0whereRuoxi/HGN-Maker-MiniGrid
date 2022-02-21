( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b442 - block
    b100 - block
    b747 - block
    b989 - block
    b359 - block
    b668 - block
    b443 - block
    b581 - block
    b698 - block
    b543 - block
    b143 - block
    b149 - block
    b635 - block
    b246 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b442 )
    ( on b100 b442 )
    ( on b747 b100 )
    ( on b989 b747 )
    ( on b359 b989 )
    ( on b668 b359 )
    ( on b443 b668 )
    ( on b581 b443 )
    ( on b698 b581 )
    ( on b543 b698 )
    ( on b143 b543 )
    ( on b149 b143 )
    ( on b635 b149 )
    ( on b246 b635 )
    ( clear b246 )
  )
  ( :goal
    ( and
      ( clear b442 )
    )
  )
)
