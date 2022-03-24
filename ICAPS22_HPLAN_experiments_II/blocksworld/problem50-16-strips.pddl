( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b325 - block
    b156 - block
    b789 - block
    b953 - block
    b839 - block
    b434 - block
    b458 - block
    b170 - block
    b49 - block
    b772 - block
    b550 - block
    b497 - block
    b329 - block
    b285 - block
    b173 - block
    b568 - block
    b269 - block
    b702 - block
    b178 - block
    b244 - block
    b911 - block
    b987 - block
    b223 - block
    b992 - block
    b98 - block
    b881 - block
    b935 - block
    b864 - block
    b307 - block
    b913 - block
    b616 - block
    b821 - block
    b687 - block
    b593 - block
    b676 - block
    b736 - block
    b690 - block
    b235 - block
    b266 - block
    b800 - block
    b647 - block
    b701 - block
    b516 - block
    b549 - block
    b282 - block
    b756 - block
    b650 - block
    b27 - block
    b246 - block
    b9 - block
    b313 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b325 )
    ( on b156 b325 )
    ( on b789 b156 )
    ( on b953 b789 )
    ( on b839 b953 )
    ( on b434 b839 )
    ( on b458 b434 )
    ( on b170 b458 )
    ( on b49 b170 )
    ( on b772 b49 )
    ( on b550 b772 )
    ( on b497 b550 )
    ( on b329 b497 )
    ( on b285 b329 )
    ( on b173 b285 )
    ( on b568 b173 )
    ( on b269 b568 )
    ( on b702 b269 )
    ( on b178 b702 )
    ( on b244 b178 )
    ( on b911 b244 )
    ( on b987 b911 )
    ( on b223 b987 )
    ( on b992 b223 )
    ( on b98 b992 )
    ( on b881 b98 )
    ( on b935 b881 )
    ( on b864 b935 )
    ( on b307 b864 )
    ( on b913 b307 )
    ( on b616 b913 )
    ( on b821 b616 )
    ( on b687 b821 )
    ( on b593 b687 )
    ( on b676 b593 )
    ( on b736 b676 )
    ( on b690 b736 )
    ( on b235 b690 )
    ( on b266 b235 )
    ( on b800 b266 )
    ( on b647 b800 )
    ( on b701 b647 )
    ( on b516 b701 )
    ( on b549 b516 )
    ( on b282 b549 )
    ( on b756 b282 )
    ( on b650 b756 )
    ( on b27 b650 )
    ( on b246 b27 )
    ( on b9 b246 )
    ( on b313 b9 )
    ( clear b313 )
  )
  ( :goal
    ( and
      ( clear b325 )
    )
  )
)
