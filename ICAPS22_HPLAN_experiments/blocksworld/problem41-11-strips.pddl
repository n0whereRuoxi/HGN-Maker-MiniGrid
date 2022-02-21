( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b389 - block
    b62 - block
    b724 - block
    b125 - block
    b851 - block
    b290 - block
    b276 - block
    b59 - block
    b221 - block
    b184 - block
    b775 - block
    b569 - block
    b979 - block
    b638 - block
    b771 - block
    b493 - block
    b562 - block
    b977 - block
    b859 - block
    b898 - block
    b590 - block
    b391 - block
    b748 - block
    b999 - block
    b532 - block
    b709 - block
    b546 - block
    b561 - block
    b680 - block
    b244 - block
    b122 - block
    b674 - block
    b733 - block
    b355 - block
    b902 - block
    b79 - block
    b442 - block
    b947 - block
    b625 - block
    b35 - block
    b728 - block
    b981 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b389 )
    ( on b62 b389 )
    ( on b724 b62 )
    ( on b125 b724 )
    ( on b851 b125 )
    ( on b290 b851 )
    ( on b276 b290 )
    ( on b59 b276 )
    ( on b221 b59 )
    ( on b184 b221 )
    ( on b775 b184 )
    ( on b569 b775 )
    ( on b979 b569 )
    ( on b638 b979 )
    ( on b771 b638 )
    ( on b493 b771 )
    ( on b562 b493 )
    ( on b977 b562 )
    ( on b859 b977 )
    ( on b898 b859 )
    ( on b590 b898 )
    ( on b391 b590 )
    ( on b748 b391 )
    ( on b999 b748 )
    ( on b532 b999 )
    ( on b709 b532 )
    ( on b546 b709 )
    ( on b561 b546 )
    ( on b680 b561 )
    ( on b244 b680 )
    ( on b122 b244 )
    ( on b674 b122 )
    ( on b733 b674 )
    ( on b355 b733 )
    ( on b902 b355 )
    ( on b79 b902 )
    ( on b442 b79 )
    ( on b947 b442 )
    ( on b625 b947 )
    ( on b35 b625 )
    ( on b728 b35 )
    ( on b981 b728 )
    ( clear b981 )
  )
  ( :goal
    ( and
      ( clear b389 )
    )
  )
)
