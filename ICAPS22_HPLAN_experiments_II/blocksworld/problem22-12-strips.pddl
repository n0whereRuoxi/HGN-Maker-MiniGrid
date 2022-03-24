( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b614 - block
    b157 - block
    b555 - block
    b68 - block
    b652 - block
    b377 - block
    b600 - block
    b735 - block
    b936 - block
    b315 - block
    b887 - block
    b187 - block
    b501 - block
    b100 - block
    b175 - block
    b787 - block
    b354 - block
    b7 - block
    b765 - block
    b337 - block
    b283 - block
    b905 - block
    b794 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b614 )
    ( on b157 b614 )
    ( on b555 b157 )
    ( on b68 b555 )
    ( on b652 b68 )
    ( on b377 b652 )
    ( on b600 b377 )
    ( on b735 b600 )
    ( on b936 b735 )
    ( on b315 b936 )
    ( on b887 b315 )
    ( on b187 b887 )
    ( on b501 b187 )
    ( on b100 b501 )
    ( on b175 b100 )
    ( on b787 b175 )
    ( on b354 b787 )
    ( on b7 b354 )
    ( on b765 b7 )
    ( on b337 b765 )
    ( on b283 b337 )
    ( on b905 b283 )
    ( on b794 b905 )
    ( clear b794 )
  )
  ( :goal
    ( and
      ( clear b614 )
    )
  )
)
