( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b823 - block
    b968 - block
    b609 - block
    b905 - block
    b210 - block
    b666 - block
    b724 - block
    b206 - block
    b424 - block
    b14 - block
    b917 - block
    b543 - block
    b363 - block
    b195 - block
    b991 - block
    b828 - block
    b520 - block
    b347 - block
    b903 - block
    b332 - block
    b280 - block
    b505 - block
    b23 - block
    b842 - block
    b25 - block
    b110 - block
    b224 - block
    b605 - block
    b885 - block
    b716 - block
    b639 - block
    b979 - block
    b922 - block
    b89 - block
    b830 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b823 )
    ( on b968 b823 )
    ( on b609 b968 )
    ( on b905 b609 )
    ( on b210 b905 )
    ( on b666 b210 )
    ( on b724 b666 )
    ( on b206 b724 )
    ( on b424 b206 )
    ( on b14 b424 )
    ( on b917 b14 )
    ( on b543 b917 )
    ( on b363 b543 )
    ( on b195 b363 )
    ( on b991 b195 )
    ( on b828 b991 )
    ( on b520 b828 )
    ( on b347 b520 )
    ( on b903 b347 )
    ( on b332 b903 )
    ( on b280 b332 )
    ( on b505 b280 )
    ( on b23 b505 )
    ( on b842 b23 )
    ( on b25 b842 )
    ( on b110 b25 )
    ( on b224 b110 )
    ( on b605 b224 )
    ( on b885 b605 )
    ( on b716 b885 )
    ( on b639 b716 )
    ( on b979 b639 )
    ( on b922 b979 )
    ( on b89 b922 )
    ( on b830 b89 )
    ( clear b830 )
  )
  ( :goal
    ( and
      ( clear b823 )
    )
  )
)
