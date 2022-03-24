( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b339 - block
    b892 - block
    b929 - block
    b307 - block
    b818 - block
    b702 - block
    b815 - block
    b221 - block
    b895 - block
    b820 - block
    b830 - block
    b861 - block
    b722 - block
    b833 - block
    b836 - block
    b288 - block
    b817 - block
    b707 - block
    b488 - block
    b101 - block
    b965 - block
    b860 - block
    b468 - block
    b287 - block
    b502 - block
    b191 - block
    b776 - block
    b982 - block
    b75 - block
    b835 - block
    b940 - block
    b291 - block
    b6 - block
    b668 - block
    b886 - block
    b220 - block
    b912 - block
    b351 - block
    b258 - block
    b495 - block
    b958 - block
    b739 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b339 )
    ( on b892 b339 )
    ( on b929 b892 )
    ( on b307 b929 )
    ( on b818 b307 )
    ( on b702 b818 )
    ( on b815 b702 )
    ( on b221 b815 )
    ( on b895 b221 )
    ( on b820 b895 )
    ( on b830 b820 )
    ( on b861 b830 )
    ( on b722 b861 )
    ( on b833 b722 )
    ( on b836 b833 )
    ( on b288 b836 )
    ( on b817 b288 )
    ( on b707 b817 )
    ( on b488 b707 )
    ( on b101 b488 )
    ( on b965 b101 )
    ( on b860 b965 )
    ( on b468 b860 )
    ( on b287 b468 )
    ( on b502 b287 )
    ( on b191 b502 )
    ( on b776 b191 )
    ( on b982 b776 )
    ( on b75 b982 )
    ( on b835 b75 )
    ( on b940 b835 )
    ( on b291 b940 )
    ( on b6 b291 )
    ( on b668 b6 )
    ( on b886 b668 )
    ( on b220 b886 )
    ( on b912 b220 )
    ( on b351 b912 )
    ( on b258 b351 )
    ( on b495 b258 )
    ( on b958 b495 )
    ( on b739 b958 )
    ( clear b739 )
  )
  ( :goal
    ( and
      ( clear b339 )
    )
  )
)
