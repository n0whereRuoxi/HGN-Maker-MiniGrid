( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b465 - block
    b530 - block
    b84 - block
    b839 - block
    b500 - block
    b456 - block
    b407 - block
    b934 - block
    b93 - block
    b447 - block
    b542 - block
    b670 - block
    b769 - block
    b868 - block
    b860 - block
    b726 - block
    b990 - block
    b331 - block
    b640 - block
    b22 - block
    b865 - block
    b385 - block
    b985 - block
    b339 - block
    b616 - block
    b388 - block
    b321 - block
    b366 - block
    b974 - block
    b113 - block
    b896 - block
    b851 - block
    b531 - block
    b870 - block
    b964 - block
    b808 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b465 )
    ( on b530 b465 )
    ( on b84 b530 )
    ( on b839 b84 )
    ( on b500 b839 )
    ( on b456 b500 )
    ( on b407 b456 )
    ( on b934 b407 )
    ( on b93 b934 )
    ( on b447 b93 )
    ( on b542 b447 )
    ( on b670 b542 )
    ( on b769 b670 )
    ( on b868 b769 )
    ( on b860 b868 )
    ( on b726 b860 )
    ( on b990 b726 )
    ( on b331 b990 )
    ( on b640 b331 )
    ( on b22 b640 )
    ( on b865 b22 )
    ( on b385 b865 )
    ( on b985 b385 )
    ( on b339 b985 )
    ( on b616 b339 )
    ( on b388 b616 )
    ( on b321 b388 )
    ( on b366 b321 )
    ( on b974 b366 )
    ( on b113 b974 )
    ( on b896 b113 )
    ( on b851 b896 )
    ( on b531 b851 )
    ( on b870 b531 )
    ( on b964 b870 )
    ( on b808 b964 )
    ( clear b808 )
  )
  ( :goal
    ( and
      ( clear b465 )
    )
  )
)
