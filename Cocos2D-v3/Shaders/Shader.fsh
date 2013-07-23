//
//  Shader.fsh
//  Cocos2D-v3
//
//  Created by Lars Birkemose on 7/23/13.
//  Copyright (c) 2013 Lars Birkemose. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
