( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b765 - block
    b907 - block
    b619 - block
    b368 - block
    b213 - block
    b788 - block
    b974 - block
    b360 - block
    b875 - block
    b817 - block
    b35 - block
    b762 - block
    b859 - block
    b59 - block
    b281 - block
    b298 - block
    b502 - block
    b42 - block
    b167 - block
    b237 - block
    b438 - block
    b787 - block
    b20 - block
    b536 - block
    b119 - block
    b367 - block
    b672 - block
    b366 - block
    b894 - block
    b207 - block
    b903 - block
    b538 - block
    b525 - block
    b950 - block
    b887 - block
    b21 - block
    b592 - block
    b94 - block
    b585 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b765 )
    ( on b907 b765 )
    ( on b619 b907 )
    ( on b368 b619 )
    ( on b213 b368 )
    ( on b788 b213 )
    ( on b974 b788 )
    ( on b360 b974 )
    ( on b875 b360 )
    ( on b817 b875 )
    ( on b35 b817 )
    ( on b762 b35 )
    ( on b859 b762 )
    ( on b59 b859 )
    ( on b281 b59 )
    ( on b298 b281 )
    ( on b502 b298 )
    ( on b42 b502 )
    ( on b167 b42 )
    ( on b237 b167 )
    ( on b438 b237 )
    ( on b787 b438 )
    ( on b20 b787 )
    ( on b536 b20 )
    ( on b119 b536 )
    ( on b367 b119 )
    ( on b672 b367 )
    ( on b366 b672 )
    ( on b894 b366 )
    ( on b207 b894 )
    ( on b903 b207 )
    ( on b538 b903 )
    ( on b525 b538 )
    ( on b950 b525 )
    ( on b887 b950 )
    ( on b21 b887 )
    ( on b592 b21 )
    ( on b94 b592 )
    ( on b585 b94 )
    ( clear b585 )
  )
  ( :goal
    ( and
      ( clear b765 )
    )
  )
)
