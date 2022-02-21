( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b164 - block
    b475 - block
    b267 - block
    b534 - block
    b93 - block
    b521 - block
    b930 - block
    b268 - block
    b117 - block
    b456 - block
    b823 - block
    b889 - block
    b251 - block
    b728 - block
    b80 - block
    b567 - block
    b860 - block
    b64 - block
    b427 - block
    b855 - block
    b377 - block
    b851 - block
    b632 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b164 )
    ( on b475 b164 )
    ( on b267 b475 )
    ( on b534 b267 )
    ( on b93 b534 )
    ( on b521 b93 )
    ( on b930 b521 )
    ( on b268 b930 )
    ( on b117 b268 )
    ( on b456 b117 )
    ( on b823 b456 )
    ( on b889 b823 )
    ( on b251 b889 )
    ( on b728 b251 )
    ( on b80 b728 )
    ( on b567 b80 )
    ( on b860 b567 )
    ( on b64 b860 )
    ( on b427 b64 )
    ( on b855 b427 )
    ( on b377 b855 )
    ( on b851 b377 )
    ( on b632 b851 )
    ( clear b632 )
  )
  ( :goal
    ( and
      ( clear b164 )
    )
  )
)
