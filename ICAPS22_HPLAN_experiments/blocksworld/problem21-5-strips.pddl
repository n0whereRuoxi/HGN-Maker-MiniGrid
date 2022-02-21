( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b538 - block
    b753 - block
    b306 - block
    b203 - block
    b777 - block
    b431 - block
    b415 - block
    b472 - block
    b113 - block
    b139 - block
    b829 - block
    b735 - block
    b561 - block
    b776 - block
    b839 - block
    b64 - block
    b170 - block
    b379 - block
    b570 - block
    b302 - block
    b502 - block
    b569 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b538 )
    ( on b753 b538 )
    ( on b306 b753 )
    ( on b203 b306 )
    ( on b777 b203 )
    ( on b431 b777 )
    ( on b415 b431 )
    ( on b472 b415 )
    ( on b113 b472 )
    ( on b139 b113 )
    ( on b829 b139 )
    ( on b735 b829 )
    ( on b561 b735 )
    ( on b776 b561 )
    ( on b839 b776 )
    ( on b64 b839 )
    ( on b170 b64 )
    ( on b379 b170 )
    ( on b570 b379 )
    ( on b302 b570 )
    ( on b502 b302 )
    ( on b569 b502 )
    ( clear b569 )
  )
  ( :goal
    ( and
      ( clear b538 )
    )
  )
)
