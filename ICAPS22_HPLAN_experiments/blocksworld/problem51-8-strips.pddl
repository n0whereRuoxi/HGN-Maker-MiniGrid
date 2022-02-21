( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b437 - block
    b613 - block
    b306 - block
    b243 - block
    b325 - block
    b847 - block
    b587 - block
    b358 - block
    b877 - block
    b377 - block
    b938 - block
    b542 - block
    b197 - block
    b464 - block
    b552 - block
    b915 - block
    b962 - block
    b592 - block
    b2 - block
    b880 - block
    b957 - block
    b448 - block
    b826 - block
    b466 - block
    b453 - block
    b268 - block
    b680 - block
    b157 - block
    b599 - block
    b761 - block
    b618 - block
    b538 - block
    b63 - block
    b591 - block
    b844 - block
    b630 - block
    b454 - block
    b186 - block
    b419 - block
    b233 - block
    b8 - block
    b388 - block
    b601 - block
    b319 - block
    b851 - block
    b321 - block
    b472 - block
    b627 - block
    b220 - block
    b730 - block
    b85 - block
    b928 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b437 )
    ( on b613 b437 )
    ( on b306 b613 )
    ( on b243 b306 )
    ( on b325 b243 )
    ( on b847 b325 )
    ( on b587 b847 )
    ( on b358 b587 )
    ( on b877 b358 )
    ( on b377 b877 )
    ( on b938 b377 )
    ( on b542 b938 )
    ( on b197 b542 )
    ( on b464 b197 )
    ( on b552 b464 )
    ( on b915 b552 )
    ( on b962 b915 )
    ( on b592 b962 )
    ( on b2 b592 )
    ( on b880 b2 )
    ( on b957 b880 )
    ( on b448 b957 )
    ( on b826 b448 )
    ( on b466 b826 )
    ( on b453 b466 )
    ( on b268 b453 )
    ( on b680 b268 )
    ( on b157 b680 )
    ( on b599 b157 )
    ( on b761 b599 )
    ( on b618 b761 )
    ( on b538 b618 )
    ( on b63 b538 )
    ( on b591 b63 )
    ( on b844 b591 )
    ( on b630 b844 )
    ( on b454 b630 )
    ( on b186 b454 )
    ( on b419 b186 )
    ( on b233 b419 )
    ( on b8 b233 )
    ( on b388 b8 )
    ( on b601 b388 )
    ( on b319 b601 )
    ( on b851 b319 )
    ( on b321 b851 )
    ( on b472 b321 )
    ( on b627 b472 )
    ( on b220 b627 )
    ( on b730 b220 )
    ( on b85 b730 )
    ( on b928 b85 )
    ( clear b928 )
  )
  ( :goal
    ( and
      ( clear b437 )
    )
  )
)
