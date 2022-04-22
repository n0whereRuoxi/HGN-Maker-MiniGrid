( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b475 - block
    b490 - block
    b709 - block
    b68 - block
    b942 - block
    b313 - block
    b160 - block
    b940 - block
    b190 - block
    b651 - block
    b671 - block
    b341 - block
    b16 - block
    b897 - block
    b827 - block
    b434 - block
    b608 - block
    b122 - block
    b41 - block
    b662 - block
    b514 - block
    b696 - block
    b70 - block
    b748 - block
    b509 - block
    b276 - block
    b432 - block
    b562 - block
    b380 - block
    b892 - block
    b683 - block
    b442 - block
    b567 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b475 )
    ( on b490 b475 )
    ( on b709 b490 )
    ( on b68 b709 )
    ( on b942 b68 )
    ( on b313 b942 )
    ( on b160 b313 )
    ( on b940 b160 )
    ( on b190 b940 )
    ( on b651 b190 )
    ( on b671 b651 )
    ( on b341 b671 )
    ( on b16 b341 )
    ( on b897 b16 )
    ( on b827 b897 )
    ( on b434 b827 )
    ( on b608 b434 )
    ( on b122 b608 )
    ( on b41 b122 )
    ( on b662 b41 )
    ( on b514 b662 )
    ( on b696 b514 )
    ( on b70 b696 )
    ( on b748 b70 )
    ( on b509 b748 )
    ( on b276 b509 )
    ( on b432 b276 )
    ( on b562 b432 )
    ( on b380 b562 )
    ( on b892 b380 )
    ( on b683 b892 )
    ( on b442 b683 )
    ( on b567 b442 )
    ( clear b567 )
  )
  ( :goal
    ( and
      ( clear b475 )
    )
  )
)
