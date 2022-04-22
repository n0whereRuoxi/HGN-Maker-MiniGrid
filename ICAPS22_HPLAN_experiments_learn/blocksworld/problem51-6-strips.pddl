( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b809 - block
    b773 - block
    b688 - block
    b714 - block
    b231 - block
    b929 - block
    b897 - block
    b456 - block
    b295 - block
    b15 - block
    b197 - block
    b305 - block
    b701 - block
    b544 - block
    b52 - block
    b917 - block
    b7 - block
    b232 - block
    b931 - block
    b282 - block
    b408 - block
    b328 - block
    b284 - block
    b612 - block
    b625 - block
    b572 - block
    b380 - block
    b553 - block
    b183 - block
    b400 - block
    b936 - block
    b636 - block
    b298 - block
    b734 - block
    b616 - block
    b777 - block
    b949 - block
    b361 - block
    b463 - block
    b847 - block
    b140 - block
    b319 - block
    b750 - block
    b780 - block
    b62 - block
    b942 - block
    b8 - block
    b352 - block
    b105 - block
    b120 - block
    b972 - block
    b970 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b809 )
    ( on b773 b809 )
    ( on b688 b773 )
    ( on b714 b688 )
    ( on b231 b714 )
    ( on b929 b231 )
    ( on b897 b929 )
    ( on b456 b897 )
    ( on b295 b456 )
    ( on b15 b295 )
    ( on b197 b15 )
    ( on b305 b197 )
    ( on b701 b305 )
    ( on b544 b701 )
    ( on b52 b544 )
    ( on b917 b52 )
    ( on b7 b917 )
    ( on b232 b7 )
    ( on b931 b232 )
    ( on b282 b931 )
    ( on b408 b282 )
    ( on b328 b408 )
    ( on b284 b328 )
    ( on b612 b284 )
    ( on b625 b612 )
    ( on b572 b625 )
    ( on b380 b572 )
    ( on b553 b380 )
    ( on b183 b553 )
    ( on b400 b183 )
    ( on b936 b400 )
    ( on b636 b936 )
    ( on b298 b636 )
    ( on b734 b298 )
    ( on b616 b734 )
    ( on b777 b616 )
    ( on b949 b777 )
    ( on b361 b949 )
    ( on b463 b361 )
    ( on b847 b463 )
    ( on b140 b847 )
    ( on b319 b140 )
    ( on b750 b319 )
    ( on b780 b750 )
    ( on b62 b780 )
    ( on b942 b62 )
    ( on b8 b942 )
    ( on b352 b8 )
    ( on b105 b352 )
    ( on b120 b105 )
    ( on b972 b120 )
    ( on b970 b972 )
    ( clear b970 )
  )
  ( :goal
    ( and
      ( clear b809 )
    )
  )
)
