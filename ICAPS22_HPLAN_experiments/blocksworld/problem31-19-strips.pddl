( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b695 - block
    b504 - block
    b962 - block
    b118 - block
    b935 - block
    b443 - block
    b595 - block
    b643 - block
    b770 - block
    b960 - block
    b404 - block
    b771 - block
    b214 - block
    b712 - block
    b514 - block
    b961 - block
    b464 - block
    b787 - block
    b550 - block
    b675 - block
    b626 - block
    b223 - block
    b572 - block
    b173 - block
    b46 - block
    b91 - block
    b307 - block
    b508 - block
    b174 - block
    b306 - block
    b421 - block
    b657 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b695 )
    ( on b504 b695 )
    ( on b962 b504 )
    ( on b118 b962 )
    ( on b935 b118 )
    ( on b443 b935 )
    ( on b595 b443 )
    ( on b643 b595 )
    ( on b770 b643 )
    ( on b960 b770 )
    ( on b404 b960 )
    ( on b771 b404 )
    ( on b214 b771 )
    ( on b712 b214 )
    ( on b514 b712 )
    ( on b961 b514 )
    ( on b464 b961 )
    ( on b787 b464 )
    ( on b550 b787 )
    ( on b675 b550 )
    ( on b626 b675 )
    ( on b223 b626 )
    ( on b572 b223 )
    ( on b173 b572 )
    ( on b46 b173 )
    ( on b91 b46 )
    ( on b307 b91 )
    ( on b508 b307 )
    ( on b174 b508 )
    ( on b306 b174 )
    ( on b421 b306 )
    ( on b657 b421 )
    ( clear b657 )
  )
  ( :goal
    ( and
      ( clear b695 )
    )
  )
)
