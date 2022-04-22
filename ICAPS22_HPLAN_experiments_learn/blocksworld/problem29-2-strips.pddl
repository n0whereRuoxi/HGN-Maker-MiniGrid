( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b881 - block
    b867 - block
    b82 - block
    b249 - block
    b286 - block
    b859 - block
    b533 - block
    b61 - block
    b91 - block
    b462 - block
    b759 - block
    b992 - block
    b237 - block
    b956 - block
    b502 - block
    b738 - block
    b541 - block
    b336 - block
    b226 - block
    b689 - block
    b23 - block
    b437 - block
    b189 - block
    b750 - block
    b193 - block
    b57 - block
    b542 - block
    b180 - block
    b741 - block
    b839 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b881 )
    ( on b867 b881 )
    ( on b82 b867 )
    ( on b249 b82 )
    ( on b286 b249 )
    ( on b859 b286 )
    ( on b533 b859 )
    ( on b61 b533 )
    ( on b91 b61 )
    ( on b462 b91 )
    ( on b759 b462 )
    ( on b992 b759 )
    ( on b237 b992 )
    ( on b956 b237 )
    ( on b502 b956 )
    ( on b738 b502 )
    ( on b541 b738 )
    ( on b336 b541 )
    ( on b226 b336 )
    ( on b689 b226 )
    ( on b23 b689 )
    ( on b437 b23 )
    ( on b189 b437 )
    ( on b750 b189 )
    ( on b193 b750 )
    ( on b57 b193 )
    ( on b542 b57 )
    ( on b180 b542 )
    ( on b741 b180 )
    ( on b839 b741 )
    ( clear b839 )
  )
  ( :goal
    ( and
      ( clear b881 )
    )
  )
)
