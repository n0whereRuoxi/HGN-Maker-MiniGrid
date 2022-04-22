( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b612 - block
    b839 - block
    b415 - block
    b772 - block
    b61 - block
    b845 - block
    b965 - block
    b188 - block
    b66 - block
    b652 - block
    b125 - block
    b827 - block
    b796 - block
    b604 - block
    b311 - block
    b872 - block
    b757 - block
    b884 - block
    b345 - block
    b561 - block
    b36 - block
    b277 - block
    b824 - block
    b585 - block
    b222 - block
    b918 - block
    b403 - block
    b247 - block
    b901 - block
    b219 - block
    b498 - block
    b620 - block
    b54 - block
    b956 - block
    b719 - block
    b841 - block
    b14 - block
    b913 - block
    b318 - block
    b306 - block
    b91 - block
    b167 - block
    b632 - block
    b452 - block
    b926 - block
    b501 - block
    b232 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b612 )
    ( on b839 b612 )
    ( on b415 b839 )
    ( on b772 b415 )
    ( on b61 b772 )
    ( on b845 b61 )
    ( on b965 b845 )
    ( on b188 b965 )
    ( on b66 b188 )
    ( on b652 b66 )
    ( on b125 b652 )
    ( on b827 b125 )
    ( on b796 b827 )
    ( on b604 b796 )
    ( on b311 b604 )
    ( on b872 b311 )
    ( on b757 b872 )
    ( on b884 b757 )
    ( on b345 b884 )
    ( on b561 b345 )
    ( on b36 b561 )
    ( on b277 b36 )
    ( on b824 b277 )
    ( on b585 b824 )
    ( on b222 b585 )
    ( on b918 b222 )
    ( on b403 b918 )
    ( on b247 b403 )
    ( on b901 b247 )
    ( on b219 b901 )
    ( on b498 b219 )
    ( on b620 b498 )
    ( on b54 b620 )
    ( on b956 b54 )
    ( on b719 b956 )
    ( on b841 b719 )
    ( on b14 b841 )
    ( on b913 b14 )
    ( on b318 b913 )
    ( on b306 b318 )
    ( on b91 b306 )
    ( on b167 b91 )
    ( on b632 b167 )
    ( on b452 b632 )
    ( on b926 b452 )
    ( on b501 b926 )
    ( on b232 b501 )
    ( clear b232 )
  )
  ( :goal
    ( and
      ( clear b612 )
    )
  )
)
