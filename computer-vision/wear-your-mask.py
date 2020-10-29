import cv2
import numpy

face_haar_cascade = cv2.CascadeClassifier('./haar-cascades/haarcascade_frontalface_alt2.xml')

cap=cv2.VideoCapture(0)

while True:
    ret,test_img=cap.read()
    if not ret:
        continue
    gray_img= cv2.cvtColor(test_img, cv2.COLOR_BGR2GRAY)
    
    faces_detected = face_haar_cascade.detectMultiScale(gray_img, 1.32, 5)
        
    for (x,y,w,h) in faces_detected:
        
        cv2.rectangle(test_img,(x,y),(x+w,y+h),(255,0,0),thickness=7)
        roi_gray=gray_img[y:y+w,x:x+h]
        roi_gray=cv2.resize(roi_gray,(200,200))
        
    if numpy.array(faces_detected).shape[0] >= 1:
        cv2.putText(test_img, 'Please wear a mask'+str(), (10,test_img.shape[0] -10), cv2.FONT_HERSHEY_PLAIN, 3, (0,0,255), 2)
        print("-- Please wear a mask --")
        
    else:
        cv2.putText(test_img, 'Safe :)'+str(), (10,test_img.shape[0] -10), cv2.FONT_HERSHEY_PLAIN, 3, (0,0,255), 2)
        print("-- The user is wearing a mask --")
    
    cv2.putText(test_img, 'Press Q to terminate', (10,test_img.shape[0] -450), cv2.FONT_HERSHEY_PLAIN, 2, (0,0,255), 2)
    cv2.imshow('',test_img)    
    
    if cv2.waitKey(10) == ord('q'):
        """
        break the loop and destroy windows 
        """
        cv2.destroyAllWindows()
        break
