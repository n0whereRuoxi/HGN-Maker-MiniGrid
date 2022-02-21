( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b99 - block
    b967 - block
    b43 - block
    b907 - block
    b439 - block
    b71 - block
    b831 - block
    b648 - block
    b846 - block
    b148 - block
    b483 - block
    b842 - block
    b896 - block
    b830 - block
    b666 - block
    b460 - block
    b95 - block
    b930 - block
    b431 - block
    b912 - block
    b250 - block
    b45 - block
    b895 - block
    b810 - block
    b524 - block
    b105 - block
    b950 - block
    b815 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b99 )
    ( on b967 b99 )
    ( on b43 b967 )
    ( on b907 b43 )
    ( on b439 b907 )
    ( on b71 b439 )
    ( on b831 b71 )
    ( on b648 b831 )
    ( on b846 b648 )
    ( on b148 b846 )
    ( on b483 b148 )
    ( on b842 b483 )
    ( on b896 b842 )
    ( on b830 b896 )
    ( on b666 b830 )
    ( on b460 b666 )
    ( on b95 b460 )
    ( on b930 b95 )
    ( on b431 b930 )
    ( on b912 b431 )
    ( on b250 b912 )
    ( on b45 b250 )
    ( on b895 b45 )
    ( on b810 b895 )
    ( on b524 b810 )
    ( on b105 b524 )
    ( on b950 b105 )
    ( on b815 b950 )
    ( clear b815 )
  )
  ( :goal
    ( and
      ( clear b99 )
    )
  )
)
