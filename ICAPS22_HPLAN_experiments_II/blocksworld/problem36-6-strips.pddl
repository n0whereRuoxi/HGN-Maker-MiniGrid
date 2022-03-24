( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b288 - block
    b862 - block
    b410 - block
    b619 - block
    b95 - block
    b487 - block
    b207 - block
    b31 - block
    b815 - block
    b437 - block
    b366 - block
    b963 - block
    b388 - block
    b82 - block
    b804 - block
    b736 - block
    b303 - block
    b593 - block
    b260 - block
    b691 - block
    b764 - block
    b891 - block
    b158 - block
    b823 - block
    b725 - block
    b925 - block
    b895 - block
    b829 - block
    b981 - block
    b581 - block
    b842 - block
    b424 - block
    b683 - block
    b67 - block
    b173 - block
    b364 - block
    b852 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b288 )
    ( on b862 b288 )
    ( on b410 b862 )
    ( on b619 b410 )
    ( on b95 b619 )
    ( on b487 b95 )
    ( on b207 b487 )
    ( on b31 b207 )
    ( on b815 b31 )
    ( on b437 b815 )
    ( on b366 b437 )
    ( on b963 b366 )
    ( on b388 b963 )
    ( on b82 b388 )
    ( on b804 b82 )
    ( on b736 b804 )
    ( on b303 b736 )
    ( on b593 b303 )
    ( on b260 b593 )
    ( on b691 b260 )
    ( on b764 b691 )
    ( on b891 b764 )
    ( on b158 b891 )
    ( on b823 b158 )
    ( on b725 b823 )
    ( on b925 b725 )
    ( on b895 b925 )
    ( on b829 b895 )
    ( on b981 b829 )
    ( on b581 b981 )
    ( on b842 b581 )
    ( on b424 b842 )
    ( on b683 b424 )
    ( on b67 b683 )
    ( on b173 b67 )
    ( on b364 b173 )
    ( on b852 b364 )
    ( clear b852 )
  )
  ( :goal
    ( and
      ( clear b288 )
    )
  )
)
