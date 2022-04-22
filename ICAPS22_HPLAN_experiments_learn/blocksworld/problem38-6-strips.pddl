( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b993 - block
    b512 - block
    b141 - block
    b745 - block
    b663 - block
    b708 - block
    b741 - block
    b676 - block
    b693 - block
    b406 - block
    b865 - block
    b847 - block
    b405 - block
    b145 - block
    b374 - block
    b846 - block
    b539 - block
    b666 - block
    b330 - block
    b242 - block
    b469 - block
    b634 - block
    b313 - block
    b776 - block
    b611 - block
    b489 - block
    b618 - block
    b390 - block
    b156 - block
    b720 - block
    b795 - block
    b964 - block
    b724 - block
    b930 - block
    b564 - block
    b732 - block
    b115 - block
    b487 - block
    b57 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b993 )
    ( on b512 b993 )
    ( on b141 b512 )
    ( on b745 b141 )
    ( on b663 b745 )
    ( on b708 b663 )
    ( on b741 b708 )
    ( on b676 b741 )
    ( on b693 b676 )
    ( on b406 b693 )
    ( on b865 b406 )
    ( on b847 b865 )
    ( on b405 b847 )
    ( on b145 b405 )
    ( on b374 b145 )
    ( on b846 b374 )
    ( on b539 b846 )
    ( on b666 b539 )
    ( on b330 b666 )
    ( on b242 b330 )
    ( on b469 b242 )
    ( on b634 b469 )
    ( on b313 b634 )
    ( on b776 b313 )
    ( on b611 b776 )
    ( on b489 b611 )
    ( on b618 b489 )
    ( on b390 b618 )
    ( on b156 b390 )
    ( on b720 b156 )
    ( on b795 b720 )
    ( on b964 b795 )
    ( on b724 b964 )
    ( on b930 b724 )
    ( on b564 b930 )
    ( on b732 b564 )
    ( on b115 b732 )
    ( on b487 b115 )
    ( on b57 b487 )
    ( clear b57 )
  )
  ( :goal
    ( and
      ( clear b993 )
    )
  )
)
