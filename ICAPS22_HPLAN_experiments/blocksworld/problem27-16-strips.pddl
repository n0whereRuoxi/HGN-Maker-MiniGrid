( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b392 - block
    b656 - block
    b920 - block
    b258 - block
    b567 - block
    b318 - block
    b814 - block
    b628 - block
    b159 - block
    b445 - block
    b652 - block
    b609 - block
    b593 - block
    b672 - block
    b971 - block
    b917 - block
    b194 - block
    b611 - block
    b697 - block
    b301 - block
    b813 - block
    b31 - block
    b542 - block
    b666 - block
    b895 - block
    b413 - block
    b747 - block
    b836 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b392 )
    ( on b656 b392 )
    ( on b920 b656 )
    ( on b258 b920 )
    ( on b567 b258 )
    ( on b318 b567 )
    ( on b814 b318 )
    ( on b628 b814 )
    ( on b159 b628 )
    ( on b445 b159 )
    ( on b652 b445 )
    ( on b609 b652 )
    ( on b593 b609 )
    ( on b672 b593 )
    ( on b971 b672 )
    ( on b917 b971 )
    ( on b194 b917 )
    ( on b611 b194 )
    ( on b697 b611 )
    ( on b301 b697 )
    ( on b813 b301 )
    ( on b31 b813 )
    ( on b542 b31 )
    ( on b666 b542 )
    ( on b895 b666 )
    ( on b413 b895 )
    ( on b747 b413 )
    ( on b836 b747 )
    ( clear b836 )
  )
  ( :goal
    ( and
      ( clear b392 )
    )
  )
)
