( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b741 - block
    b845 - block
    b576 - block
    b555 - block
    b985 - block
    b592 - block
    b294 - block
    b14 - block
    b241 - block
    b108 - block
    b997 - block
    b306 - block
    b476 - block
    b254 - block
    b235 - block
    b640 - block
    b777 - block
    b873 - block
    b993 - block
    b182 - block
    b637 - block
    b892 - block
    b24 - block
    b299 - block
    b377 - block
    b924 - block
    b846 - block
    b926 - block
    b570 - block
    b322 - block
    b45 - block
    b569 - block
    b40 - block
    b534 - block
    b839 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b741 )
    ( on b845 b741 )
    ( on b576 b845 )
    ( on b555 b576 )
    ( on b985 b555 )
    ( on b592 b985 )
    ( on b294 b592 )
    ( on b14 b294 )
    ( on b241 b14 )
    ( on b108 b241 )
    ( on b997 b108 )
    ( on b306 b997 )
    ( on b476 b306 )
    ( on b254 b476 )
    ( on b235 b254 )
    ( on b640 b235 )
    ( on b777 b640 )
    ( on b873 b777 )
    ( on b993 b873 )
    ( on b182 b993 )
    ( on b637 b182 )
    ( on b892 b637 )
    ( on b24 b892 )
    ( on b299 b24 )
    ( on b377 b299 )
    ( on b924 b377 )
    ( on b846 b924 )
    ( on b926 b846 )
    ( on b570 b926 )
    ( on b322 b570 )
    ( on b45 b322 )
    ( on b569 b45 )
    ( on b40 b569 )
    ( on b534 b40 )
    ( on b839 b534 )
    ( clear b839 )
  )
  ( :goal
    ( and
      ( clear b741 )
    )
  )
)
